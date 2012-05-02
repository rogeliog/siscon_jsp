function com_mycompany_project_ImageViewer(){
  var $wnd_0 = window, $doc_0 = document, $stats = $wnd_0.__gwtStatsEvent?function(a){
    return $wnd_0.__gwtStatsEvent(a);
  }
  :null, $sessionId_0 = $wnd_0.__gwtStatsSessionId?$wnd_0.__gwtStatsSessionId:null, scriptsDone, loadDone, bodyDone, base = '', metaProps = {}, values = [], providers = [], answers = [], softPermutationId = 0, onLoadErrorFunc, propertyErrorFunc;
  $stats && $stats({moduleName:'com.mycompany.project.ImageViewer', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'bootstrap', millis:(new Date).getTime(), type:'begin'});
  if (!$wnd_0.__gwt_stylesLoaded) {
    $wnd_0.__gwt_stylesLoaded = {};
  }
  if (!$wnd_0.__gwt_scriptsLoaded) {
    $wnd_0.__gwt_scriptsLoaded = {};
  }
  function isHostedMode(){
    var result = false;
    try {
      var query = $wnd_0.location.search;
      return (query.indexOf('gwt.codesvr=') != -1 || (query.indexOf('gwt.hosted=') != -1 || $wnd_0.external && $wnd_0.external.gwtOnLoad)) && query.indexOf('gwt.hybrid') == -1;
    }
     catch (e) {
    }
    isHostedMode = function(){
      return result;
    }
    ;
    return result;
  }

  function maybeStartModule(){
    if (scriptsDone && loadDone) {
      var iframe = $doc_0.getElementById('com.mycompany.project.ImageViewer');
      var frameWnd = iframe.contentWindow;
      if (isHostedMode()) {
        frameWnd.__gwt_getProperty = function(name_0){
          return computePropValue(name_0);
        }
        ;
      }
      com_mycompany_project_ImageViewer = null;
      frameWnd.gwtOnLoad(onLoadErrorFunc, 'com.mycompany.project.ImageViewer', base, softPermutationId);
      $stats && $stats({moduleName:'com.mycompany.project.ImageViewer', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'moduleStartup', millis:(new Date).getTime(), type:'end'});
    }
  }

  function computeScriptBase(){
    function getDirectoryOfFile(path){
      var hashIndex = path.lastIndexOf('#');
      if (hashIndex == -1) {
        hashIndex = path.length;
      }
      var queryIndex = path.indexOf('?');
      if (queryIndex == -1) {
        queryIndex = path.length;
      }
      var slashIndex = path.lastIndexOf('/', Math.min(queryIndex, hashIndex));
      return slashIndex >= 0?path.substring(0, slashIndex + 1):'';
    }

    function ensureAbsoluteUrl(url){
      if (url.match(/^\w+:\/\//)) {
      }
       else {
        var img = $doc_0.createElement('img');
        img.src = url + 'clear.cache.gif';
        url = getDirectoryOfFile(img.src);
      }
      return url;
    }

    function tryMetaTag(){
      var metaVal = __gwt_getMetaProperty('baseUrl');
      if (metaVal != null) {
        return metaVal;
      }
      return '';
    }

    function tryNocacheJsTag(){
      var scriptTags = $doc_0.getElementsByTagName('script');
      for (var i = 0; i < scriptTags.length; ++i) {
        if (scriptTags[i].src.indexOf('com.mycompany.project.ImageViewer.nocache.js') != -1) {
          return getDirectoryOfFile(scriptTags[i].src);
        }
      }
      return '';
    }

    function tryMarkerScript(){
      var thisScript;
      if (typeof isBodyLoaded == 'undefined' || !isBodyLoaded()) {
        var markerId = '__gwt_marker_com.mycompany.project.ImageViewer';
        var markerScript;
        $doc_0.write('<script id="' + markerId + '"><\/script>');
        markerScript = $doc_0.getElementById(markerId);
        thisScript = markerScript && markerScript.previousSibling;
        while (thisScript && thisScript.tagName != 'SCRIPT') {
          thisScript = thisScript.previousSibling;
        }
        if (markerScript) {
          markerScript.parentNode.removeChild(markerScript);
        }
        if (thisScript && thisScript.src) {
          return getDirectoryOfFile(thisScript.src);
        }
      }
      return '';
    }

    function tryBaseTag(){
      var baseElements = $doc_0.getElementsByTagName('base');
      if (baseElements.length > 0) {
        return baseElements[baseElements.length - 1].href;
      }
      return '';
    }

    var tempBase = tryMetaTag();
    if (tempBase == '') {
      tempBase = tryNocacheJsTag();
    }
    if (tempBase == '') {
      tempBase = tryMarkerScript();
    }
    if (tempBase == '') {
      tempBase = tryBaseTag();
    }
    if (tempBase == '') {
      tempBase = getDirectoryOfFile($doc_0.location.href);
    }
    tempBase = ensureAbsoluteUrl(tempBase);
    base = tempBase;
    return tempBase;
  }

  function processMetas(){
    var metas = document.getElementsByTagName('meta');
    for (var i = 0, n = metas.length; i < n; ++i) {
      var meta = metas[i], name_0 = meta.getAttribute('name'), content_0;
      if (name_0) {
        name_0 = name_0.replace('com.mycompany.project.ImageViewer::', '');
        if (name_0.indexOf('::') >= 0) {
          continue;
        }
        if (name_0 == 'gwt:property') {
          content_0 = meta.getAttribute('content');
          if (content_0) {
            var value, eq = content_0.indexOf('=');
            if (eq >= 0) {
              name_0 = content_0.substring(0, eq);
              value = content_0.substring(eq + 1);
            }
             else {
              name_0 = content_0;
              value = '';
            }
            metaProps[name_0] = value;
          }
        }
         else if (name_0 == 'gwt:onPropertyErrorFn') {
          content_0 = meta.getAttribute('content');
          if (content_0) {
            try {
              propertyErrorFunc = eval(content_0);
            }
             catch (e) {
              alert('Bad handler "' + content_0 + '" for "gwt:onPropertyErrorFn"');
            }
          }
        }
         else if (name_0 == 'gwt:onLoadErrorFn') {
          content_0 = meta.getAttribute('content');
          if (content_0) {
            try {
              onLoadErrorFunc = eval(content_0);
            }
             catch (e) {
              alert('Bad handler "' + content_0 + '" for "gwt:onLoadErrorFn"');
            }
          }
        }
      }
    }
  }

  function __gwt_isKnownPropertyValue(propName, propValue){
    return propValue in values[propName];
  }

  function __gwt_getMetaProperty(name_0){
    var value = metaProps[name_0];
    return value == null?null:value;
  }

  function unflattenKeylistIntoAnswers(propValArray, value){
    var answer = answers;
    for (var i = 0, n = propValArray.length - 1; i < n; ++i) {
      answer = answer[propValArray[i]] || (answer[propValArray[i]] = []);
    }
    answer[propValArray[n]] = value;
  }

  function computePropValue(propName){
    var value = providers[propName](), allowedValuesMap = values[propName];
    if (value in allowedValuesMap) {
      return value;
    }
    var allowedValuesList = [];
    for (var k in allowedValuesMap) {
      allowedValuesList[allowedValuesMap[k]] = k;
    }
    if (propertyErrorFunc) {
      propertyErrorFunc(propName, allowedValuesList, value);
    }
    throw null;
  }

  var frameInjected;
  function maybeInjectFrame(){
    if (!frameInjected) {
      frameInjected = true;
      var iframe = $doc_0.createElement('iframe');
      iframe.src = "javascript:''";
      iframe.id = 'com.mycompany.project.ImageViewer';
      iframe.style.cssText = 'position:absolute;width:0;height:0;border:none';
      iframe.tabIndex = -1;
      $doc_0.body.appendChild(iframe);
      $stats && $stats({moduleName:'com.mycompany.project.ImageViewer', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'moduleStartup', millis:(new Date).getTime(), type:'moduleRequested'});
      iframe.contentWindow.location.replace(base + initialHtml);
    }
  }

  providers['locale'] = function(){
    var locale = null;
    var rtlocale = 'default';
    try {
      if (!locale) {
        var queryParam = location.search;
        var qpStart = queryParam.indexOf('locale=');
        if (qpStart >= 0) {
          var value = queryParam.substring(qpStart + 7);
          var end = queryParam.indexOf('&', qpStart);
          if (end < 0) {
            end = queryParam.length;
          }
          locale = queryParam.substring(qpStart + 7, end);
        }
      }
      if (!locale) {
        locale = __gwt_getMetaProperty('locale');
      }
      if (!locale) {
        locale = $wnd_0['__gwt_Locale'];
      }
      if (locale) {
        rtlocale = locale;
      }
      while (locale && !__gwt_isKnownPropertyValue('locale', locale)) {
        var lastIndex = locale.lastIndexOf('_');
        if (lastIndex < 0) {
          locale = null;
          break;
        }
        locale = locale.substring(0, lastIndex);
      }
    }
     catch (e) {
      alert('Unexpected exception in locale detection, using default: ' + e);
    }
    $wnd_0['__gwt_Locale'] = rtlocale;
    return locale || 'default';
  }
  ;
  values['locale'] = {'default':0, es:1, es_MX:2, fr:3, it:4, nl:5, nn_NO:6, no:7, pl_PL:8, sv:9, sv_SE:10};
  providers['user.agent'] = function(){
    var ua = navigator.userAgent.toLowerCase();
    var makeVersion = function(result){
      return parseInt(result[1]) * 1000 + parseInt(result[2]);
    }
    ;
    if (function(){
      return ua.indexOf('opera') != -1;
    }
    ())
      return 'opera';
    if (function(){
      return ua.indexOf('webkit') != -1 || function(){
        if (ua.indexOf('chromeframe') != -1) {
          return true;
        }
        if (typeof window['ActiveXObject'] != 'undefined') {
          try {
            var obj = new ActiveXObject('ChromeTab.ChromeFrame');
            if (obj) {
              obj.registerBhoIfNeeded();
              return true;
            }
          }
           catch (e) {
          }
        }
        return false;
      }
      ();
    }
    ())
      return 'safari';
    if (function(){
      return ua.indexOf('msie') != -1 && $doc_0.documentMode >= 9;
    }
    ())
      return 'ie9';
    if (function(){
      return ua.indexOf('msie') != -1 && $doc_0.documentMode >= 8;
    }
    ())
      return 'ie8';
    if (function(){
      var result = /msie ([0-9]+)\.([0-9]+)/.exec(ua);
      if (result && result.length == 3)
        return makeVersion(result) >= 6000;
    }
    ())
      return 'ie6';
    if (function(){
      return ua.indexOf('gecko') != -1;
    }
    ())
      return 'gecko1_8';
    return 'unknown';
  }
  ;
  values['user.agent'] = {gecko1_8:0, ie6:1, ie8:2, ie9:3, opera:4, safari:5};
  com_mycompany_project_ImageViewer.onScriptLoad = function(){
    if (frameInjected) {
      loadDone = true;
      maybeStartModule();
    }
  }
  ;
  com_mycompany_project_ImageViewer.onInjectionDone = function(){
    scriptsDone = true;
    $stats && $stats({moduleName:'com.mycompany.project.ImageViewer', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'loadExternalRefs', millis:(new Date).getTime(), type:'end'});
    maybeStartModule();
  }
  ;
  processMetas();
  computeScriptBase();
  var strongName;
  var initialHtml;
  if (isHostedMode()) {
    if ($wnd_0.external && ($wnd_0.external.initModule && $wnd_0.external.initModule('com.mycompany.project.ImageViewer'))) {
      $wnd_0.location.reload();
      return;
    }
    initialHtml = 'hosted.html?com_mycompany_project_ImageViewer';
    strongName = '';
  }
  $stats && $stats({moduleName:'com.mycompany.project.ImageViewer', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'bootstrap', millis:(new Date).getTime(), type:'selectingPermutation'});
  if (!isHostedMode()) {
    try {
      unflattenKeylistIntoAnswers(['default', 'opera'], '00CD9BC978F0CDEE37EA7C57063A9AD4');
      unflattenKeylistIntoAnswers(['sv', 'gecko1_8'], '056A19C7693B2907839FB1F2BB31733F');
      unflattenKeylistIntoAnswers(['sv_SE', 'gecko1_8'], '056A19C7693B2907839FB1F2BB31733F');
      unflattenKeylistIntoAnswers(['default', 'safari'], '0986218B1298C7F01016F13A5ED50413');
      unflattenKeylistIntoAnswers(['fr', 'safari'], '0CE78BE9183B31B62E7ABB7B8DFB6397');
      unflattenKeylistIntoAnswers(['es_MX', 'ie9'], '11C18A8F02A2A29E04CAB41212CC6DFC');
      unflattenKeylistIntoAnswers(['es_MX', 'opera'], '23E4C3797936496CF37D5384567C80C6');
      unflattenKeylistIntoAnswers(['nn_NO', 'ie8'], '29D898FB800FFB062CDE2C30EB8E538D');
      unflattenKeylistIntoAnswers(['nl', 'opera'], '3FEE572483B4AE0CF8AD62C1C0F4E7ED');
      unflattenKeylistIntoAnswers(['default', 'ie9'], '4025035B078553C62C00B7F63AF15F95');
      unflattenKeylistIntoAnswers(['fr', 'opera'], '409AA8A80C7B80C2BE0A4FB42B560F5A');
      unflattenKeylistIntoAnswers(['no', 'ie9'], '40C3794F0337ABCE182B6BC49ECD4700');
      unflattenKeylistIntoAnswers(['it', 'opera'], '4753CC11C5F206A555F1C99DDF054056');
      unflattenKeylistIntoAnswers(['es_MX', 'safari'], '4BA5F503B51661F313831480BDB1CF3D');
      unflattenKeylistIntoAnswers(['es_MX', 'ie6'], '4CE1673F61404A2CECF4ED9954B8C864');
      unflattenKeylistIntoAnswers(['it', 'ie6'], '57C2949E94AA9698323DD8111BAE877D');
      unflattenKeylistIntoAnswers(['fr', 'ie9'], '5800FED3882EB463AC5B88773E30E7EF');
      unflattenKeylistIntoAnswers(['es_MX', 'gecko1_8'], '5A1914DC668DFC99F04593E702AAA8D7');
      unflattenKeylistIntoAnswers(['pl_PL', 'gecko1_8'], '628ED292FA7F05E07D214F504D31D36E');
      unflattenKeylistIntoAnswers(['pl_PL', 'ie9'], '64488816E3F11FE132583F11A5EDC3A9');
      unflattenKeylistIntoAnswers(['nl', 'safari'], '645EDC8AEDDBDD5CE213DDF1CA059712');
      unflattenKeylistIntoAnswers(['sv', 'ie8'], '6707BE7EF9AE814184A513E74B128253');
      unflattenKeylistIntoAnswers(['sv_SE', 'ie8'], '6707BE7EF9AE814184A513E74B128253');
      unflattenKeylistIntoAnswers(['no', 'ie8'], '6BA5FBFBBE6E74B369B5A880D7E9EF19');
      unflattenKeylistIntoAnswers(['nl', 'ie6'], '6E5A8E589A5A61FDFA8557B8F3837866');
      unflattenKeylistIntoAnswers(['it', 'gecko1_8'], '70F440394610E24CF1152B3BE2E9AD29');
      unflattenKeylistIntoAnswers(['es', 'safari'], '77EE330AFDEDE9C562BD2CEEBB057428');
      unflattenKeylistIntoAnswers(['default', 'ie6'], '796D4EBE12A82A98A92738E8FBB26761');
      unflattenKeylistIntoAnswers(['sv', 'ie6'], '7C6BAE9DB14A1AA88CD19A1E6A78993F');
      unflattenKeylistIntoAnswers(['sv_SE', 'ie6'], '7C6BAE9DB14A1AA88CD19A1E6A78993F');
      unflattenKeylistIntoAnswers(['pl_PL', 'ie8'], '7CFD66D7B3D13AB85001A1D2009CF24B');
      unflattenKeylistIntoAnswers(['pl_PL', 'safari'], '85541290D63A37799A326CCD4B5E982F');
      unflattenKeylistIntoAnswers(['pl_PL', 'opera'], '93297B8B475513DEBB4B6CB1C93DD4EC');
      unflattenKeylistIntoAnswers(['nn_NO', 'safari'], '99835BDBCBE499EE4B70115B4A53BB9C');
      unflattenKeylistIntoAnswers(['nn_NO', 'opera'], 'A2B2771C84D692376375B42DB071E8A7');
      unflattenKeylistIntoAnswers(['default', 'gecko1_8'], 'A9C0362B9EEC9BF3F7352272D1FF7049');
      unflattenKeylistIntoAnswers(['es', 'opera'], 'A9EC0C8AEFDB0B28728D456F371BABCD');
      unflattenKeylistIntoAnswers(['fr', 'ie8'], 'ABA52E20C0BB496B056A30AB084768C1');
      unflattenKeylistIntoAnswers(['no', 'ie6'], 'AE735E478B1727DD26964E20D82960C2');
      unflattenKeylistIntoAnswers(['nl', 'ie9'], 'B77EC55F0DA2346DE59E5A8194CE5090');
      unflattenKeylistIntoAnswers(['es', 'ie8'], 'B7F1100B5F4374FC6E8E54A5C25D3ADC');
      unflattenKeylistIntoAnswers(['nl', 'ie8'], 'B8651B37B68F1EA69D79FD9D6FE1E22C');
      unflattenKeylistIntoAnswers(['es', 'gecko1_8'], 'BACB5AAA7266B65AE0B809B84C597DB8');
      unflattenKeylistIntoAnswers(['fr', 'gecko1_8'], 'BEB19E2DD84D56ABB34E4AA17F5E9E4D');
      unflattenKeylistIntoAnswers(['sv', 'safari'], 'C166646A908182DABB4E641C8FF9353D');
      unflattenKeylistIntoAnswers(['sv_SE', 'safari'], 'C166646A908182DABB4E641C8FF9353D');
      unflattenKeylistIntoAnswers(['pl_PL', 'ie6'], 'C1E3220C2EE0360A907F74148E4A4E17');
      unflattenKeylistIntoAnswers(['default', 'ie8'], 'C3196E7B69CF1E7E8677B445D697E7BE');
      unflattenKeylistIntoAnswers(['it', 'ie8'], 'C4416166E94B0B981A05A8C299FE2E7E');
      unflattenKeylistIntoAnswers(['nl', 'gecko1_8'], 'C4B11A1DBE9D96EFFF0EABDDD932FD7D');
      unflattenKeylistIntoAnswers(['nn_NO', 'gecko1_8'], 'CC9D76AE958DEC9D6F993BD158B00E92');
      unflattenKeylistIntoAnswers(['fr', 'ie6'], 'D6B1B5C48A7B6B2299E8088E7BC3A088');
      unflattenKeylistIntoAnswers(['nn_NO', 'ie9'], 'DFE81C4F506AD8E78822D69C3D0FDC98');
      unflattenKeylistIntoAnswers(['it', 'safari'], 'E062971001A12D798625FF7B1ABB5657');
      unflattenKeylistIntoAnswers(['no', 'safari'], 'E344724EA177C75950848AA2D7FB1382');
      unflattenKeylistIntoAnswers(['sv', 'ie9'], 'E7F5C96BE96DDA07E11C00AAF79308A9');
      unflattenKeylistIntoAnswers(['sv_SE', 'ie9'], 'E7F5C96BE96DDA07E11C00AAF79308A9');
      unflattenKeylistIntoAnswers(['es', 'ie9'], 'E991031927CDB1BC728E7F6259D2EDBE');
      unflattenKeylistIntoAnswers(['no', 'opera'], 'EA145D41466EC1FEDC56A70DF24BCEBB');
      unflattenKeylistIntoAnswers(['it', 'ie9'], 'F46081517BACFA6D9BBB92597B2E6F26');
      unflattenKeylistIntoAnswers(['es_MX', 'ie8'], 'F77CB9FCE93595D479141987F7743107');
      unflattenKeylistIntoAnswers(['nn_NO', 'ie6'], 'F99C6C4C2F473B7C5D83EEF97D7A3089');
      unflattenKeylistIntoAnswers(['es', 'ie6'], 'F9B4A60D1749113F43F39061F92C6075');
      unflattenKeylistIntoAnswers(['no', 'gecko1_8'], 'FB60C086013C23DA94BAFA2FCEE143B5');
      unflattenKeylistIntoAnswers(['sv', 'opera'], 'FBD7B972F8560920665B5A1923C83BD8');
      unflattenKeylistIntoAnswers(['sv_SE', 'opera'], 'FBD7B972F8560920665B5A1923C83BD8');
      strongName = answers[computePropValue('locale')][computePropValue('user.agent')];
      var idx = strongName.indexOf(':');
      if (idx != -1) {
        softPermutationId = Number(strongName.substring(idx + 1));
        strongName = strongName.substring(0, idx);
      }
      initialHtml = strongName + '.cache.html';
    }
     catch (e) {
      return;
    }
  }
  var onBodyDoneTimerId;
  function onBodyDone(){
    if (!bodyDone) {
      bodyDone = true;
      if (!__gwt_stylesLoaded['gwt/standard/standard.css']) {
        var l = $doc_0.createElement('link');
        __gwt_stylesLoaded['gwt/standard/standard.css'] = l;
        l.setAttribute('rel', 'stylesheet');
        l.setAttribute('href', base + 'gwt/standard/standard.css');
        $doc_0.getElementsByTagName('head')[0].appendChild(l);
      }
      if (!__gwt_stylesLoaded['gwt-cal-google.css']) {
        var l = $doc_0.createElement('link');
        __gwt_stylesLoaded['gwt-cal-google.css'] = l;
        l.setAttribute('rel', 'stylesheet');
        l.setAttribute('href', base + 'gwt-cal-google.css');
        $doc_0.getElementsByTagName('head')[0].appendChild(l);
      }
      if (!__gwt_stylesLoaded['js/columntree/column-tree.css']) {
        var l = $doc_0.createElement('link');
        __gwt_stylesLoaded['js/columntree/column-tree.css'] = l;
        l.setAttribute('rel', 'stylesheet');
        l.setAttribute('href', base + 'js/columntree/column-tree.css');
        $doc_0.getElementsByTagName('head')[0].appendChild(l);
      }
      if (!__gwt_stylesLoaded['GwtExt.css']) {
        var l = $doc_0.createElement('link');
        __gwt_stylesLoaded['GwtExt.css'] = l;
        l.setAttribute('rel', 'stylesheet');
        l.setAttribute('href', base + 'GwtExt.css');
        $doc_0.getElementsByTagName('head')[0].appendChild(l);
      }
      if (!__gwt_stylesLoaded['js/ext/resources/css/ext-all.css']) {
        var l = $doc_0.createElement('link');
        __gwt_stylesLoaded['js/ext/resources/css/ext-all.css'] = l;
        l.setAttribute('rel', 'stylesheet');
        l.setAttribute('href', base + 'js/ext/resources/css/ext-all.css');
        $doc_0.getElementsByTagName('head')[0].appendChild(l);
      }
      maybeStartModule();
      if ($doc_0.removeEventListener) {
        $doc_0.removeEventListener('DOMContentLoaded', onBodyDone, false);
      }
      if (onBodyDoneTimerId) {
        clearInterval(onBodyDoneTimerId);
      }
    }
  }

  if ($doc_0.addEventListener) {
    $doc_0.addEventListener('DOMContentLoaded', function(){
      maybeInjectFrame();
      onBodyDone();
    }
    , false);
  }
  var onBodyDoneTimerId = setInterval(function(){
    if (/loaded|complete/.test($doc_0.readyState)) {
      maybeInjectFrame();
      onBodyDone();
    }
  }
  , 50);
  $stats && $stats({moduleName:'com.mycompany.project.ImageViewer', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'bootstrap', millis:(new Date).getTime(), type:'end'});
  $stats && $stats({moduleName:'com.mycompany.project.ImageViewer', sessionId:$sessionId_0, subSystem:'startup', evtGroup:'loadExternalRefs', millis:(new Date).getTime(), type:'begin'});
  if (!__gwt_scriptsLoaded['js/columntree/ColumnNodeUI.js']) {
    __gwt_scriptsLoaded['js/columntree/ColumnNodeUI.js'] = true;
    document.write('<script language="javascript" src="' + base + 'js/columntree/ColumnNodeUI.js"><\/script>');
  }
  if (!__gwt_scriptsLoaded['js/ext/adapter/ext/ext-base.js']) {
    __gwt_scriptsLoaded['js/ext/adapter/ext/ext-base.js'] = true;
    document.write('<script language="javascript" src="' + base + 'js/ext/adapter/ext/ext-base.js"><\/script>');
  }
  if (!__gwt_scriptsLoaded['js/ext/ext-all.js']) {
    __gwt_scriptsLoaded['js/ext/ext-all.js'] = true;
    document.write('<script language="javascript" src="' + base + 'js/ext/ext-all.js"><\/script>');
  }
  $doc_0.write('<script defer="defer">com_mycompany_project_ImageViewer.onInjectionDone(\'com.mycompany.project.ImageViewer\')<\/script>');
}

com_mycompany_project_ImageViewer();
