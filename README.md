# partnership
workscouts

--Create app --

1.Create simple parent(simple project) (file . porm).
2.In parent -> create module web-app(file .war).
3.In parent -> create other module (file .jar)

--Config mutilple module--
web.xml       -> filter(security), dipatcher(file config)
dipatcher.xml -> import appconfig-data.xml (conect-database config, scan model)
                        appconfig-mvc.xml  (scan controller, config resources, fileUpload, tile3 config)
                        appconfig-security.xml (security config)
                        other "moduleName"applicationContext.xml (scan service and repository)


