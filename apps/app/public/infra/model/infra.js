define(["model/config"], function ($config) {
  var _create = function (_payload, _cb) {
    webix
      .ajax()
      .post($config.api_prefix + "?action=infra.create", _payload)
      .then(function (_ret) {
        var _res = _ret.json();
        if (!_res.result && _res.error_code == 400) {
          location.hash =
            "#!/auth/login:redir=" + encodeURIComponent(location.hash);
        } else _cb(_res);
        //        _ret && _cb(_ret.json());
      });
  };
  var _update = function (_payload, _cb) {
    webix
      .ajax()
      .post($config.api_prefix + "?action=infra.update", _payload)
      .then(function (_ret) {
        var _res = _ret.json();
        if (!_res.result && _res.error_code == 400) {
          location.hash =
            "#!/auth/login:redir=" + encodeURIComponent(location.hash);
        } else _cb(_res);
        //        _ret && _cb(_ret.json());
      });
  };
  var _get = function (_payload, _cb) {
    webix
      .ajax()
      .post($config.api_prefix + "?action=infra.get", _payload)
      .then(function (_ret) {
        //          _ret && _cb(_ret.json());
        var _res = _ret.json();
        if (!_res.result && _res.error_code == 400) {
          location.hash =
            "#!/auth/login:redir=" + encodeURIComponent(location.hash);
        } else _cb(_res);
      });
  };
      var _getnodes = function (_payload, _cb) {
    webix
      .ajax()
      .post($config.api_prefix + "?action=infra.getnodes", _payload)
      .then(function (_ret) {
        //          _ret && _cb(_ret.json());
        var _res = _ret.json();
        if (!_res.result && _res.error_code == 400) {
          location.hash =
            "#!/auth/login:redir=" + encodeURIComponent(location.hash);
        } else _cb(_res);
      });
  };
  var _delete = function (_payload, _cb) {
    webix
      .ajax()
      .post($config.api_prefix + "?action=infra.delete", _payload)
      .then(function (_ret) {
        var _res = _ret.json();
        if (!_res.result && _res.error_code == 400) {
          location.hash =
            "#!/auth/login:redir=" + encodeURIComponent(location.hash);
        } else _cb(_res);

        //        _ret && _cb(_ret.json());
      });
  };
  var _list = function (_cb) {
    webix
      .ajax()
      .get($config.api_prefix + "?action=infra.list")
      .then(function (_ret) {
        var _res = _ret.json();
        if (!_res.result && _res.error_code == 400) {
          location.hash =
            "#!/auth/login:redir=" + encodeURIComponent(location.hash);
        } else _cb(_res);
      });
  };
  return {
    create: _create,
    update: _update,
    list: _list,
    get: _get,
    getnodes: _getnodes,
    delete: _delete,
  };
});
