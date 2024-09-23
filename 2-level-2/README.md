## Steps I followed

1. I have created a yaml file for the creating the different resources for K8s cluster in single file for shop backend and other file for cron and also attaching screenshots.

2. I have created a kind cluster using 'kind create cluster --config kind-config.yaml --name flaschenpost'

3. Then using this command to create the deployment 'kubectl create deployment shop-backend --image=strm/helloworld-http:latest --port=80' 
'kubectl expose deployment shop-backend --type=ClusterIP --port=80 --target-port=80'  and for ingress

kubectl apply -f - <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: shop-backend-ingress
spec:
  rules:
  - host: shop.example.com  # Use your domain or set up a local host for testing
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: shop-backend
            port:
              number: 80
EOF

and for hpa 'kubectl autoscale deployment shop-backend --cpu-percent=70 --min=3 --max=10'

And tweaking based on the document few setting using 'kubectl edit deploy deploy_name' or you can output as yaml like 'kubectl get deployment deployment_name -o yaml' and output it yaml file and edit and then again you can apply, same goes for other kind types.

4. And for cronjob creation I have used 'kubectl create cronjob hello-world-cj --image=busybox --schedule="*/30 * * * *" -- /bin/sh -c "echo Hello World"'

5. I have kept security context commented as image doesn't have any other user and when I am running it without root user, pod stuck in crashloopbackoff due permission denied error due '/main.sh: line 3: /www/index.html: Permission denied' and also network policies can be added to control, limit pod access by defining ingress and egress rules.

5. Few things I have kept commented in yaml to show that these things are also necessary depending upon case to case but for the simplicity , I have for now commented them.
