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
		//---------------------2--------------------
		//detailNext //test
		let item1 ="",item2 ="", item3 ="";
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
		
		
		$("#item1").val(item1);
		//console.log(item1);
		//console.log($("#item1").val());
		$("#item2").val(item2);
		//console.log(item2);
		$("#item3").val(item3);
		//console.log(item3);
		
    })
    
    $(".gim_detail .detailNext").click(function(e){
		//detailNext //test
		let item1 ="",item2 ="", item3 ="", req =$(".gim_detail .calcItem .item_opsReq .req").val();
		//e.preventDefault();
		
		//---------------------3---------------------

		 for(let i =0;i<$(".gim_detail .calcItem .item_ops1 ").length;i++){
			if(i<$(".gim_detail .calcItem .item_ops1 ").length-1){
				item1 += $(".gim_detail .calcItem .item_ops1 ").eq(i).find(".item1").val()+",";
			}else{
				item1 += $(".gim_detail .calcItem .item_ops1 ").eq(i).find(".item1").val();
			}
		}
		 for(let i =0;i<$(".gim_detail .calcItem .item_ops2 ").length;i++){
			if(i<$(".gim_detail .calcItem .productItem2 ").length-1){
				item2 += $(".gim_detail .calcItem .item_ops2 ").eq(i).find(".item2").val()+",";
			}else{
				item2 += $(".gim_detail .calcItem .item_ops2 ").eq(i).find(".item2").val();
			}
		}
		 for(let i =0;i<$(".gim_detail .calcItem .item_ops3 ").length;i++){
			if(i<$(".gim_detail .calcItem .item_ops3 ").length-1){
				item3 += $(".gim_detail .calcItem .item_ops3 ").eq(i).find(".item3").val()+",";
			}else{
				item3 += $(".gim_detail .calcItem .item_ops3 ").eq(i).find(".item3").val();
			}
		}
		
		
		$("#item1").val(item1);
		console.log(item1);
		//console.log($("#item1").val());
		$("#item2").val(item2);
		console.log(item2);
		$("#item3").val(item3);
		console.log(item3);
		$("#req").val(req);
		console.log(req);
		
    })
    
    $(".shopping .test").click(function(e){
		//detailNext //test
		let item1 ="", req =0;
		e.preventDefault();
		
		//---------------------4---------------------

		 for(let i =0;i<$(".shopping .mainList .item ").length;i++){
			let=0;
			if(i<$(".shopping .mainList .item ").length-1){
				lat=
				item1 += $(".shopping .mainList .item ").eq(i).find(".item1").val()+",";
			}else{
				item1 += $(".shopping .mainList .item ").eq(i).find(".item1").val();
			}
		}
		
		
		
		$("#item1").val(item1);
		console.log(item1);
		console.log($("#item1").val());
		$("#price").val(price);
		console.log(price);
		
		
    })
    
})