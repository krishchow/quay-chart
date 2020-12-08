build:
	helm package quay --destination .deploy

upload:
	cr upload -o krishchow -r quay-chart -p .deploy --token $CH_TOKEN

