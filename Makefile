include config.mk

## cleaned    : Perform data preprocessing and cleaning.
.PHONY: cleaned
cleaned: $(CLEANED_DATA)

$(CLEANED_DATA): $(DATA_CLEANING) $(USERS)
	$(LANGUAGE) $< 

## model    : Build Machine Learning models.
.PHONY: model
model: $(MODEL)
	
$(MODEL): $(MODEL_SOURCE) $(CLEANED_DATA)
	$(LANGUAGE) $<

## analysis   : Perform exploratory data analysis.
.PHONY: analyses
analyses: $(ANALYSIS)
	
$(ANALYSIS): $(ANALYSIS_SOURCE) $(CLEANED_DATA)
	$(LANGUAGE) $<

## csv     : Generate the CSV file.
.PHONY: csv
csv: $(PLOT_SOURCE)
	@echo "Model, Test, Training" > $@; \
	model_name=$$(basename $(PLOT_SOURCE) .txt); \
	echo -n "$$model_name, " >> $@; \
	grep -oP "Training accuracy: \K[0-9.]+" $(PLOT_SOURCE) | tr '\n' ',' | sed 's/,$$$$//' >> $@; \
	echo >> $@

## plots       : Generate model accuracy plots.
.PHONY: plots
plots: $(PLOTS)
	
$(PLOTS): $(PLOTS_SOURCE) $(PLOTS)
	$(LANGUAGE) $<

## clean       : Remove auto-generated files.
.PHONY: clean
clean:
	rm -f $(CLEANED_DATA)
	rm -f $(PLOT_SOURCE)

.PHONY: help
help: Makefile
	@sed -n 's/^##//p' $<

