CURRENT_DIR = $(shell pwd)
EXAMPLES_PATH = $(CURRENT_DIR)/examples/*
MODULES_PATH = $(CURRENT_DIR)/modules/*
SUBDIRS := $(shell find $(EXAMPLES_PATH) -maxdepth 0 -type d)
MODULEDIRS := $(shell find $(MODULES_PATH)/ -maxdepth 0 -type d)
PID_LIST :=

.PHONY: all

tfinit:
	@for folder in $(SUBDIRS) ; do \
		echo "=====================================================================================================" ;\
		echo "[info]: Initialising $$folder stack" ;\
		echo "=====================================================================================================" ;\
		cd $$folder ;\
		terraform init & \
		PID_LIST+=$$! ;\
	done ;\
	wait $(PID_LIST)

tfplan:
	@for folder in $(SUBDIRS) ; do \
		echo "=====================================================================================================" ;\
		echo "[info]: Plan for $$folder stack" ;\
		echo "=====================================================================================================" ;\
		cd $$folder ;\
		FOLDER_NAME=$${PWD##*/} ;\
		terraform plan -no-color | tee $$FOLDER_NAME.log &\
		PID_LIST+=$$! ;\
	done ;\
	wait $(PID_LIST)

tfapply:
	@for folder in $(SUBDIRS) ; do \
		echo "=====================================================================================================" ;\
		echo "[info]: Plan for $$folder stack" ;\
		echo "=====================================================================================================" ;\
		cd $$folder ;\
		terraform plan --out=plan.tmp & \
		PID_LIST+=$$! ;\
	done ;\
	wait $(PID_LIST)
	@for folder in $(SUBDIRS) ; do \
		echo "=====================================================================================================" ;\
		echo "[info]: Creating/Updating $$folder stack" ;\
		echo "=====================================================================================================" ;\
		cd $$folder ;\
		FOLDER_NAME=$${PWD##*/} ;\
		(terraform apply -no-color plan.tmp | tee $$FOLDER_NAME.log ) & \
		PID_LIST+=$$! ;\
	done ;\
	wait $(PID_LIST)
	@for folder in $(SUBDIRS) ; do \
		echo "=====================================================================================================" ;\
		echo "[info]: cleaning $$folder plan.tmp file" ;\
		echo "=====================================================================================================" ;\
		cd $$folder ;\
		rm plan.tmp  & \
		PID_LIST+=$$! ;\
	done ;\
	wait $(PID_LIST)

tfdestroy:
	@for folder in $(SUBDIRS) ; do \
		echo "=====================================================================================================" ;\
		echo "[info]: Removing $$folder stack" ;\
		echo "=====================================================================================================" ;\
		cd $$folder ;\
		FOLDER_NAME=$${PWD##*/} ;\
		(terraform destroy -no-color --auto-approve | tee $$FOLDER_NAME.log) & \
		PID_LIST+=$$! ;\
	done ;\
	wait $(PID_LIST)

tfexampleclean:
	@for folder in $(SUBDIRS) ; do \
		echo "=====================================================================================================" ;\
		echo "[info]: Cleaning $$folder tests" ;\
		echo "=====================================================================================================" ;\
		rm -rf $$folder/.terraform* ;\
	done

tfmoduleclean:
	@for folder in $(SUBDIRS) ; do \
		echo "=====================================================================================================" ;\
		echo "[info]: Cleaning $$folder terraform files" ;\
		echo "=====================================================================================================" ;\
		rm -rf $$folder/.terraform* .terraform* ;\
	done

cleanstatefiles:
	@for folder in $(SUBDIRS) ; do \
		echo "=====================================================================================================" ;\
		echo "[info]: Deleting the state files for $$folder" ;\
		echo "=====================================================================================================" ;\
		cd $$folder ;\
		rm -rf terraform.tfstate* ;\
	done

plan: tfinit tfplan

apply: tfinit tfapply

clean: tfdestroy tfexampleclean tfmoduleclean
