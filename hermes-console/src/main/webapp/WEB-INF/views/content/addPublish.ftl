 <#if msg??>
	<div class="alert alert-danger alert-dismissible fade in" role="alert">
		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		${msg!}
	</div>
</#if>
 <div class="panel panel-primary">
        <div class="panel-heading">内容发布</div>
        <div class="panel-body">
            <div id="data" style="display:block">
          <form class="form-horizontal" role="form" id="addForm" method="post">
              <div class="form-group">
                <label for="" class="col-sm-2 control-label"><span class="color_red">* </span>文章标题</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" id="articleTitle"  name="articleTitle" placeholder="文章标题">
                </div>
				<div class="col-xs-2">
					<span class="alert-danger" style="display:none;background:none">必填项，限定为60个字符（30个汉字）</span>
				</div>                
              </div>
              <div class="form-group">
                <label for="" class="col-sm-2 control-label">发布人</label>
                <div class="col-sm-5">
                  <span class="vlight">admin</span>
                </div>
              </div>
              <div class="form-group">
                <label for="" class="col-sm-2 control-label"><span class="color_red">* </span>所属分类</label>
                <div class="col-sm-8">
                  <div class="row">
                        <div class="col-xs-2 hm-col">
                            <label for=""  class="sr-only">选择一级分类</label>
                            <select id="levelOne" name="levelOne" class="form-control categoryLevelOne">
  						         <option value="">请选择</option>
						               <#list categoryForLevel1 as cf1>
							     <option value="${cf1.id}">${cf1.name}</option>
						               </#list>
                            </select>
                        </div>
                        <div class="col-xs-2 hm-col">
                            <label for=""  class="sr-only">选择二级分类</label>
					        <select id="levelTwo" name="levelTwo" class="form-control categoryLevelTwo">
						         <option value="">请选择</option>
						               <#list categoryForLevel2 as cf2>
							     <option value="${cf2.id}">${cf2.name}</option>
						               </#list>
					        </select>
                        </div>
                        <div class="col-xs-2 hm-col">
                            <label for=""  class="sr-only">选择三级分类</label>
					        <select id="levelThree" name="levelThree" class="form-control categoryLevelThree">
						         <option value="">请选择</option>
						               <#list categoryForLevel3 as cf3>
							     <option value="${cf3.id}">${cf3.name}</option>
						               </#list>
					        </select>
                        </div>
	                 <div class="col-xs-2">
						<span class="alert-danger" style="display:none;background:none">必填项</span>
					 </div>                                        
                    </div>                                  
                </div>
              </div>
              <div class="form-group">
                <label for="" class="col-sm-2 control-label">排序</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" id="order" name="order" placeholder="1">
                </div>
		        <div class="col-xs-2">
					<span class="alert-danger" style="display:none;background:none">必填项，只能为数字</span>
				</div>                                                        
              </div>
              <div class="form-group">
                <label for="" class="col-sm-2 control-label">文章关键字</label>
                <div class="col-sm-5">
                  <input type="text" class="form-control" id="keywords" name="keywords" placeholder="文章关键字">
                </div>
                <span class="vlight">请以，号隔开</span>
                <div class="col-xs-2">
					<span class="alert-danger" style="display:none;background:none">非必填项，限定为60个字符（30个汉字）</span>
				</div>                                
              </div>
              <div class="form-group">
                <label for="" class="col-sm-2 control-label">文章描述</label>
                <div class="col-sm-8">
                  <textarea class="form-control" rows="3" id="description" name="description"></textarea>
                </div>
                <div class="col-xs-2">
					<span class="alert-danger" style="display:none;background:none">非必填项，限定字符400个（汉字为200个）</span>
				</div>                                                
              </div>
              <div class="form-group">
                <label for="" class="col-sm-2 control-label"><span class="color_red">* </span>内容编辑</label>
                <div class="col-sm-8">
                  <textarea rows="13" id="content" name="content"></textarea>
                </div>
                <div class="col-xs-2">
					<span class="alert-danger" style="display:none;background:none">必填项，限定字符1万个（汉字为5000个）</span>
				</div>                                                                
              </div>
              
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <div class="col-xs-3"><button type="button" class="btn btn-primary btn-block" id="publishContent">提交发布</button></div>
                  <div class="col-xs-3"><button type="button" class="btn btn-primary btn-block" id="submitAgin">提交并继续发布</button></div>
                  <div class="col-xs-3"><button type="button" class="btn btn-default btn-block" id="cacelContentButton">取消发布</button></div>                  
                </div>
              </div>
            </form>     
        </div> 
        </div>
      </div>


<script type="text/javascript">
jQuery(function($) {
UE.getEditor('content');
	$("#articleTitle,#levelOne,#order,#keywords,#description,#content").on('blur',function(i,item){
		checkInput(this);
	});
    //对输入元素进行校验
	function checkInput(e){
		var $this = $(e);
		var val = $this.val();
		if( ( (e.id == 'articleTitle' && !/.{1,30}/.test(val))
		    ||(e.id == 'order' && !/^[0-9]+$/.test(val))
		    ||(e.id == 'levelOne' && $this.val()=='')		    
		    ||(e.id == 'keywords' && !/.{0,30}/.test(val)) //非必填
		    ||(e.id == 'description' && !/.{0,400}/.test(val)) //非必填
		    ||(e.id == 'content' && !/.{1,5000}/.test(val)) ) 		    
		    ){
			$this.parent().parent().find(".alert-danger:eq(0)").attr("e_id",e.id);
			$this.parent().parent().find(".alert-danger:eq(0)").show();
			return false;
		}else{
			var e_id = $this.parent().parent().find(".alert-danger:eq(0)").attr("e_id");
			if(e_id=='' || e_id==e.id){
				$this.parent().parent().find(".alert-danger:eq(0)").hide();
			}
			return true;
		}
	}

    //元素失去焦点时，触发数据校验事件
	function checkAll(){
		$("#articleTitle,#levelOne,#order,#keywords,#description,#content").each(function(i,item){
			checkInput(this);
		});
		return $("span.alert-danger:visible").length==0;
	}

	//点击提交按钮
	$("#publishContent").on("click",function(){
	   if(checkAll()){
			$.link.html(null, {
				url: '${app}/content/addPublish',
				data: $("#addForm").serialize(),
				target: 'main'
			});
		};
	});

	//点击提交并继续发布按钮
	$("#submitAgin").on("click",function(){
	   if(checkAll()){
		$.link.html(null, {
			url: '${app}/content/addPublishAgain',
			data: $("#addForm").serialize(),
			target: 'main'
		});
		};
	});
    //点击发布页面中取消按钮
	$("#cacelContentButton").on("click",function(){
		$.link.html(null, {
			url: '${app}/content/contentIndex',
			target: 'main'
		});
	});
	
	//当一级分类下拉框改变时候，获取二级分类下拉框
	$(".categoryLevelOne").bind("change",function() {
		var parentCode = $(".categoryLevelOne").val();
				
			$.ajax({
			type : 'POST',
			url : '${app}/content/findCategoryByParent',
			data : 'level=二级&parentCode='+parentCode+'&parentId='+parentCode,
			success : function(msg)
			{
				// 清空表格
				$(".categoryLevelTwo").empty();
				var option = "<option value=\"\">请选择</option>";
				var _data = msg[0].parent.children;
			    _data[0] = msg[0];				
				$.each(_data, function(k, v)
				{
					option += "<option value=\"" + v['id'] + "\">" + v['name'] + "</option>";
				});
				$(".categoryLevelTwo").append(option);
			},
			error : function(msg, textStatus, e)
			{
				alert("获取二级分类失败");
				$.link.html(null, {
					url: '${app}/content/categoryIndex',
					target: 'main'
				});
			}
		});
	});

	//当二级分类下拉框改变时候，获取三级分类下拉框
	$(".categoryLevelTwo").bind("change",function() {
		var parentCode = $(".categoryLevelTwo").val();
				
			$.ajax({
			type : 'POST',
			url : '${app}/content/findCategoryByParent',
			data : 'level=二级&parentCode='+parentCode+'&parentId='+parentCode,
			success : function(msg)
			{
				// 清空表格
				$(".categoryLevelThree").empty();
				var option = "<option value=\"\">请选择</option>";
				var _data = msg[0].parent.children;
			    _data[0] = msg[0];								
				$.each(_data, function(k, v)
				{
					option += "<option value=\"" + v['id'] + "\">" + v['name'] + "</option>";
				});
				$(".categoryLevelThree").append(option);
			},
			error : function(msg, textStatus, e)
			{
				alert("获取二级分类失败");
				$.link.html(null, {
					url: '${app}/content/categoryIndex',
					target: 'main'
				});
			}
		});
	});
	
});
</script> 