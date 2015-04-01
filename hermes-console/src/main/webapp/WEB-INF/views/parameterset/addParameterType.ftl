 <#if msg??>
	<div class="alert alert-danger alert-dismissible fade in" role="alert">
		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		${msg!}
	</div>
</#if>
 <div class="panel panel-primary">
        <div class="panel-heading">新增参数配置</div>
        <div class="panel-body">
            <div id="data" style="display:block">
          <form class="form-horizontal" role="form" id="addForm" method="post">
              <div class="form-group">
                <label for="" class="col-sm-2 control-label"><span style="color:red;">* </span>参数类型</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" name="parameterType" id ="parameterType" placeholder="参数类型"/>
                </div>
                <div class="col-xs-2">
					<span class="alert-danger" style="display:none;background:none">必填项，且只能输入中文</span>
				</div>                                                                        
              </div>
              <div class="form-group">
                <label for="" class="col-sm-2 control-label">状态</label>
                <div class="col-sm-5">
                   <select id="status" name="status" class="form-control">
                   	  <option value="00">启用</option>
					  <option value="09">禁用</option>
                   </select>
                </div>
              </div>              
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <div class="col-xs-3"><button type="button" class="btn btn-primary btn-block" id="addParameterType">添加</button></div>
                  <div class="col-xs-3"><button type="button" class="btn btn-default btn-block" id="cancelParameterType">取消</button></div>
                </div>
              </div>
            </form>     
        </div> 
        </div>
      </div>

<script type="text/javascript">

jQuery(function($) {
     //点击新增分类页面中新增按钮
	$("#addParameterType").on("click",function(){
		$.link.html(null, {
			url: '${app}/parameter/handerAddParameterType',
			data: $("#addForm").serialize(),
			target: 'main'
		});
	});
	//点击新增分类页面中取消按钮
	$("#cancelParameterType").on("click",function(){
		$.link.html(null, {
			url: '${app}/parameter/index',
			target: 'main'
		});
	});
	$('#parameterType').keyup(function(){
	   var parameterType  = $("#parameterType").val();
	   if(!/^[\u4e00-\u9fa5]{2,20}$/.test(parameterType)){
		   $(this).parent().parent().find(".alert-danger:eq(0)").show();
		   document.getElementById("addParameterType").disabled = true;		     		       
	   }else{
	   	   $(this).parent().parent().find(".alert-danger:eq(0)").hide();	
	   	   document.getElementById("addParameterType").disabled = false;		     	   	      
	   }
	});

});
</script>  