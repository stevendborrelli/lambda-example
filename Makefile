FUNCTION_NAME := ssm-parameters
BASE_DIR := lambda
FUNCTION_DIR := $(BASE_DIR)/$(FUNCTION_NAME)
FUNCTION_ZIP := $(FUNCTION_NAME).zip
FUNCTION_BASE64 := $(FUNCTION_NAME).base64

BUILD_DIR := build


package-function: build-dir function-zip function-encode
	echo "package"

clean:
	rm -f $(BASE_DIR)/$(BUILD_DIR)/$(FUNCTION_ZIP) $(BASE_DIR)/$(BUILD_DIR)/$(FUNCTION_BASE64)

build-dir:
	mkdir -p $(BASE_DIR)/$(BUILD_DIR)

function-zip:
	cd $(FUNCTION_DIR) && zip -r ../$(BUILD_DIR)/$(FUNCTION_ZIP) .

function-encode:
	cat $(BASE_DIR)/$(BUILD_DIR)/$(FUNCTION_ZIP) | base64 > $(BASE_DIR)/$(BUILD_DIR)/$(FUNCTION_BASE64)
