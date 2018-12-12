;css読み込み
[loadcss file="&mp.style"]


;選択済みの選択肢にマーク
;指定属性：glinkと同じ
[macro name="sc_glink"]
[iscript]
//var tmp_storage = mp.storage === undefined || mp.storage === "" || mp.storage === null ? tyrano.plugin.kag.getStack("macro").storage : mp.storage
var tmp_storage = mp.storage === undefined || mp.storage === "" || mp.storage === null ? tyrano.plugin.kag.stat.stack["macro"][0].storage : mp.storage
tf.storage = tmp_storage
console.log(mp.target)
tf.label = "trail_" + tmp_storage.replace(".ks", "").replace(/\u002f/g, "").replace(/:/g, "").replace(/\./g, "")
tf.label = tf.label + "_" + mp.target.replace("*", "")
tf.name = null
if(TYRANO.kag.variable.sf.record[tf.label] === undefined){
    tf.name = mp.name
}else{
    tf.name = mp.name + ",checked"
}
[endscript]
[glink width="520" height="40" size="24" storage="&tf.storage" color="bk-image" name="&tf.name" clickse="button_click.ogg" enterse="button_hover.ogg" x="220" *]
[endmacro]

;ラベル通過済みの選択肢にマーク
[macro name="sc_restore"]
[iscript]
var el = $(".glink_button")
for(var i = 0; i < el.length; i++){
    var glink = JSON.parse($(el[i]).attr("data-event-pm"))
    var label = "trail_" + glink.storage.replace(".ks", "").replace(/\u002f/g, "").replace(/:/g, "").replace(/\./g, "")
    label = label + "_" + glink.target.replace("*", "")
    name = null
    if(TYRANO.kag.variable.sf.record[label] === undefined){
    }else{
        $(el[i]).addClass("checked")
    }
}
[endscript]
[endmacro]

[return]