generate: concat minify

all: generate deploy deploy-dspace clean

dall: generate devcp deploy deploy-dspace clean

concat:
	cat fix-templates.js ui/jquery.ui.core.js ui/jquery.ui.widget.js \
		ui/jquery.ui.mouse.js ui/jquery.ui.position.js \
		ui/jquery.ui.popup.js external/globalize.js \
		ui/jquery.ui.button.js\
		datepicker-rewrite/localization.js datepicker-rewrite/date.js \
		datepicker-rewrite/picker.js datepicker-rewrite/jquery.tmpl.js > \
	       	jquery.ui.datepicker-accessible.cat.js

minify:
	uglifyjs jquery.ui.datepicker-accessible.cat.js > \
		jquery.ui.datepicker-accessible.min.js

clean:
	rm -f jquery.ui.datepicker-accessible.cat.js
	rm -f jquery.ui.datepicker-accessible.min.js

deploy:
	cp jquery.ui.datepicker-accessible.min.js \
		~/ldocs/kb-source/dspace-xmlui/dspace-xmlui-webapp/src/main/webapp/themes/dashboard/lib/

deploy-dspace:
	cp jquery.ui.datepicker-accessible.min.js \
		/dspace/webapps/xmlui/themes/dashboard/lib/

devcp: concat
	cp jquery.ui.datepicker-accessible.cat.js \
		jquery.ui.datepicker-accessible.min.js

dev: devcp deploy deploy-dspace
