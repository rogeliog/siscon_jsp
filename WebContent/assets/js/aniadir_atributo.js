        (function(){
         	$('#mo').on('click',function(e){
         		e.preventDefault();
         		$('<select name="atributo"> <option>CRN</option> <option>attr1</option></select>').appendTo('article');
         		$('<input name="attr" type="text" class="input-xlarge" id="nombreAttr">').appendTo('article');
         
         	});
        })();