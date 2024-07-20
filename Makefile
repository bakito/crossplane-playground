template:
	helm template . --api-versions='pkg.crossplane.io/v1/Provider' --api-versions='pkg.crossplane.io/v1beta1/Function'
diff:
	helm diff upgrade --install crossplane .
upgrade:
	helm upgrade --install crossplane .
