define(["assets/js/core", "text!/_app/config.json"], function ($core, $config) {
  if (!webix.env.touch && webix.ui.scrollSize && webix.CustomScroll)
    webix.CustomScroll.init();

  //configuration
  return $core.create({
    id: app_version,
    name: app_name,
    version: app_version,
    viewdir: app_view,
    start: "/app",
    myconfig: JSON.parse($config),
  });
});
