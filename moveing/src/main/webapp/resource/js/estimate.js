/**
 * 
 */
 $(function(){
    $(".productList").click(function(e){
		e.preventDefault();
        if($(e.target).hasClass("productBtnM")){
            $(this).find(".productBtn").find("p").html($(this).find(".productBtn").find("p").html()*1-1);
            if($(this).find(".productBtn").find("p").html()*1==0){
                $(this).find(".productBtn").hide();
            }
        }else{
            $(this).find(".productBtn").show();
            console.log();
            $(this).find(".productBtn").find("p").html($(this).find(".productBtn").find("p").html()*1+1);
            console.log(e.target);
        }
    })
    
    $(".product .productCount .cntM").click(function(e){
		e.preventDefault();
        if(  $(".product .productCount .cnt").html()*1==0  )return;
        $(".product .productCount .cnt").html($(".product .productCount .cnt").html()*1-1);
    })
    $(".product .productCount .cntP").click(function(e){
		e.preventDefault();
        $(".product .productCount .cnt").html($(".product .productCount .cnt").html()*1+1);
    })
    
    $(".product .detailNext").click(function(e){
		
		let item1 ="",item2 ="", item3 ="", box =$(".product .productGim .cnt").html();
		//e.preventDefault();
		 for(let i =0;i<$(".product .productItem1 .productList").length;i++){
			if(i<$(".product .productItem1 .productList").length-1){
				item1 += $(".product .productItem1 .productList").eq(i).find(".item1").html()+",";
			}else{
				item1 += $(".product .productItem1 .productList").eq(i).find(".item1").html();
			}
		}

		 for(let i =0;i<$(".product .productItem2 .productList").length;i++){
			if(i<$(".product .productItem2 .productList").length-1){
				item2 += $(".product .productItem2 .productList").eq(i).find(".item2").html()+",";
			}else{
				item2 += $(".product .productItem2 .productList").eq(i).find(".item2").html();
			}
		}
		 for(let i =0;i<$(".product .productItem3 .productList").length;i++){
			if(i<$(".product .productItem3 .productList").length-1){
				item3 += $(".product .productItem3 .productList").eq(i).find(".item3").html()+",";
			}else{
				item3 += $(".product .productItem3 .productList").eq(i).find(".item3").html();
			}
		}

		//console.log(item1);
		$("#item1").val(item1);
		console.log(item1);
		$("#item2").val(item2);
		console.log(item2);
		$("#item3").val(item3);
		console.log(item3);
		$("#box").val(box);
		console.log(box);
		
	      //  console.log($(".product .productItem .item1")[0]);	
/*     $(".product .productItem .item2").
      $(".product .productItem .item3").
      $(".product .productGim .cnt")*/
    })
    
    
})