deploy-db:
	kubectl apply -f ./kubernetes/mongodb/ -n karsajobs

delete-db:
	kubectl delete -f ./kubernetes/mongodb/ -n karsajobs

deploy-be:
	kubectl apply -f ./kubernetes/backend/ -n karsajobs

delete-be:
	kubectl delete -f ./kubernetes/backend/ -n karsajobs

deploy-fe:
	kubectl apply -f ./kubernetes/frontend/ -n karsajobs

delete-fe:
	kubectl delete -f ./kubernetes/frontend/ -n karsajobs

.PHONY: deploy-db delete-db deploy-be delete-be deploy-fe delete-fe