docker build -t sathish1983/multi-k8s-client:latest -t sathish1983/multi-k8s-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t sathish1983/multi-k8s-server:latest -t sathish1983/multi-k8s-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t sathish1983/multi-k8s-worker:latest -t sathish1983/multi-k8s-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push sathish1983/multi-k8s-client:latest
docker push sathish1983/multi-k8s-server:latest
docker push sathish1983/multi-k8s-worker:latest

docker push sathish1983/multi-k8s-client:$GIT_SHA
docker push sathish1983/multi-k8s-server:$GIT_SHA
docker push sathish1983/multi-k8s-worker:$GIT_SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=sathish1983/multi-k8s-client:$GIT_SHA
kubectl set image deployments/server-deployment server=sathish1983/multi-k8s-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=sathish1983/multi-k8s-worker:$GIT_SHA