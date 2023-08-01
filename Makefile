.PHONY: up

up:
	go generate
	git add .
	git commit -am "update"
	git pull origin master
	git push origin master
	@echo "\n 代码提交发布..."

tag:
	git pull origin master
	git add .
	git commit -am "update"
	git push origin master
	git tag v1.0.9
	git push --tags
	@echo "\n tags 发布中..."
