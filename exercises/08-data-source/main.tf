terraform {
  # https://registry.terraform.io/providers/hashicorp/http/latest
  required_providers {
    http = {
        source = "hashicorp/http"
        version = "3.4.0"
    }
  }
}

# define 'weather' data source to issue an HTTP GET request supplying an optional request header.
data "http" "weather" {
    url = "https://api.weather.gov/points/39.73,-104.99"

    request_headers = {
        "Accept" = "application/geo+json"
    }
}

output "city" {
    //value = data.http.weather.response_body
    //value = jsondecode(data.http.weather.response_body)
    value = jsondecode(data.http.weather.response_body).properties.relativeLocation.properties.city
}