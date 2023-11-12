include config.mk

# Clean_Data
.PHONY: cleaned
cleaned: $(CLEANED_DATA)

$(CLEANED_DATA): $(DATA_CLEANING) $(USERS)
	$(LANGUAGE) $< 

# model
.PHONY: model
model: $(MODEL)
	
$(MODEL): $(MODEL_SOURCE) $(CLEANED_DATA)
	$(LANGUAGE) $<

# analysis
.PHONY: analyses
analyses: $(ANALYSIS)
	
$(ANALYSIS): $(ANALYSIS_SOURCE) $(CLEANED_DATA)
	$(LANGUAGE) $<

.PHONY: clean
clean:
	rm -f $(CLEANED_DATA)

