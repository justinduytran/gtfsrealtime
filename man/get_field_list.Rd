% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_field_list.R
\name{get_field_list}
\alias{get_field_list}
\title{Read transit_realtime.FeedMessage field with "Many" cardinality}
\usage{
get_field_list(message_list, ...)
}
\arguments{
\item{message_list}{A list of fields containing messages with identical type / number of fields set. Example field types include "StopTimeUpdate" and "TranslatedString".}

\item{...}{A sequence of strings specifying the "path" to the desired field.}
}
\value{
A list of the content of the specified field corresponding to each message.
}
\description{
Reads a field when its cardinality is "Many" (>1), requiring the output to be a list.
}
\details{
See \url{https://gtfs.org/documentation/realtime/reference} for relevant fields with "Many" cardinality.
}
\examples{
\dontrun{

# Generic code
FeedMessage <- read_gtfsrealtime(api_call)

# Assuming a TripUpdate FeedMessage:

# First obtain the field with "Many" cardinality
# In this case a message of type 'transit_realtime.TripUpdate.StopTimeUpdate'
field <- FeedMessage$entity[[1]]$trip_update$stop_time_update

# Then return the list of specified field for a single entity
# When the desired field ("stop_sequence") is a field under "stop_time_update"
get_field_list(field, "stop_sequence")
# When the desired field ("time") is a field in the "arrival" field under "stop_time_update"
get_field_list(field, "arrival", "time")

# This whole sequence can be piped:
FeedMessage$entity[[1]]$trip_update$stop_time_update |>
  get_field_list("arrival", "time")
# and is the same as:
FeedMessage$entity[[1]]$trip_update$stop_time_update[[i]]$arrival$time
# for all i in "stop_time_update"
}
}
