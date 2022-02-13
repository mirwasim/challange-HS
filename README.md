# Simple app
This is a simple web app that returns counter on how many times page has been seen.
The application is using redis to store the count.

It also has an endpoint protected by basic http auth that will provide you with a secret string.

## How to start locally
docker-compose up

## Endpoints
* GET / - path shows hello message with a counter on how many time the page has been visited.
* GET /supersecret - this path requires basic http authentication and it will tell you a super secret.

## The defnition files are deployed using helm.

## The secrets and app-config is not part of the git versions

## Resource folder contain aws resource, along EKS .

## hungerstation-app is helm chart
## deployment folder have deployment files with out helm template