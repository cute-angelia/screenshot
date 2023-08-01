# Specifies a parent image
FROM golang:1.20  as builder

# Creates an app directory to hold your app’s source code
WORKDIR /app

# Copies everything from your root directory into /app
COPY . .

# Installs Go dependencies
RUN go mod download

RUN cd cmd/screenshot

# Builds your app with optional configuration
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o screenshot -ldflags '-extldflags "-static"'

# -- Stage 2 -- #
# Create the final environment with the compiled binary.
FROM alpine
# Install any required dependencies.
# RUN apk --no-cache add ca-certificates

WORKDIR /app

# Copy the binary from the builder stage and set it as the default command.
COPY --from=builder /app/screenshot/cmd/screenshot/screenshot /app/screenshot

RUN chmod +x /app/screenshot

# Tells Docker which network port your container listens on
EXPOSE 38113

# Specifies the executable command that runs when the container starts
CMD ["/app/screenshot"]