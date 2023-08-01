Capture web page screenshots by using headless chrome browser.

## Basic Usage

See `example/main.go`

## Demo

### Docker compose

```
$ docker-compose up -d
```

Then Access the API:
```
http://localhost:38113/screenshot?url=https://bing.com&width=1280&height=720


other params

mobile bool 
format string jpg png
quality int
timeout int 

```

### k8s

**NOTE:** you should change the Ingress resource according to your needs.

```
kubectl apply -f k8s.yaml
```

