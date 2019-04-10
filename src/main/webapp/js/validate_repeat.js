$.extend($.fn.validatebox.defaults.rules, {
	repeat: {
		validator: function(value, param){
			if(value.length<=param[0]){
				var b=false;
				debugger;
				//var id=($("#id")==null?"n":$("#id").val());
				var id=$("#id").val();
				if(id==null){
					id="n";
				}
				$.ajax({url:'/seed/'+param[1]+'/validate',async:false,data:{skey:param[2],value:value,id:id},success:function(data){
					if(data=='1'){
						b=false;
					}else{
						b=true;
					}
				}});
				return b;
			}else{
				return false;
			}
			
		},
		message: '请输入！'
    }
});