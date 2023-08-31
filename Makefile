BINARY_NAME := api
BUILD_DIR := build

RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RESET := \033[0m

all: build
test: testing
run: build running

build:
	@echo "$(GREEN)building...$(RESET)"
	@mkdir -p $(BUILD_DIR)
	@go build -o $(BUILD_DIR)/$(BINARY_NAME)

install:
	@echo "$(GREEN)installing binaries to $(OUTPUT_DIR)...$(RESET)"
	@cp $(BUILD_DIR)/$(BINARY_NAME) $(OUTPUT_DIR)/$(BINARY_NAME)

clean:
	@echo "$(RED)deleting built and installed binaries...$(RESET)"
	@rm -f $(BUILD_DIR)/$(BINARY_NAME)
ifdef OUTPUT_DIR
	@rm -f $(OUTPUT_DIR)/$(BINARY_NAME)
endif

testing:
	@echo "$(GREEN)Running tests suite...$(RESET)"
	@cd $(BUILD_DIR);./$(BINARY_NAME)
running:
	$(BUILD_DIR)/$(BINARY_NAME)


.PHONY: all build install clean testing
