run:
	kubectl apply -f ./manifests/01_namespace.yaml
	./manifests/webhook-create-signed-cert.sh
	cat manifests/mutatingwebhook.yaml | manifests/webhook-patch-ca-bundle.sh > manifests/02_webhook.yaml
	kubectl apply -f ./manifests/02_webhook.yaml
	kubectl apply -f ./manifests/03_deployment.yaml
	kubectl apply -f ./manifests/04_service.yaml