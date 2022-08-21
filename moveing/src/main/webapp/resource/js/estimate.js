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
    
    $(".shopping .detailNext").click(function(e){
		//detailNext //test
		//let item ="", price =0, p_num=0; 
		// item - 디비에 올릴 데이터(종류:수량) price - 합산 가격 p_num - 현재(대/중/소) 수량 받기
		
		//let p_price=$(".shopping .mainList .discprice").text(); //현재 품목 단가 받기
		let itemNum =$(".shopping .mainList .itamnum").html();
		//let item =$(".shopping .mainList .discprice").text();
		
		let Box_L,Box_M,Box_S;
		let numBox_L,numBox_M,numBox_S;
		let item ="",pname="",discprice=0,totprice=0;
		/*let Box_L0 = $(".itam_1 .Box_L").is(":checked") ,Box_M0 = $(".itam_1 .Box_M").is(":checked"), Box_S0 = $(".itam_1 .Box_S").is(":checked");
		let Box_L0 = $(".itam_2 .Box_L").is(":checked") ,Box_M0 = $(".itam_2 .Box_M").is(":checked"), Box_S0 = $(".itam_2 .Box_S").is(":checked");
		let Box_L0 = $(".itam_3 .Box_L").is(":checked") ,Box_M0 = $(".itam_3 .Box_M").is(":checked"), Box_S0 = $(".itam_3 .Box_S").is(":checked");*/

		
		//e.preventDefault();
		
		//---------------------4---------------------

		 for(let i=0;i<itemNum;i++){
			Box_L = $(".itam_"+i+" .Box_L").is(":checked") ,Box_M = $(".itam_"+i+" .Box_M").is(":checked"), Box_S = $(".itam_"+i+" .Box_S").is(":checked");
			numBox_L = $(".itam_"+i+" .numBox_L").val() ,numBox_M = $(".itam_"+i+" .numBox_M").val(), numBox_S = $(".itam_"+i+" .numBox_S").val();
			discprice = $(".itam_"+i+" .discprice").val(),pname=$(".itam_"+i+" .pname").html();
			
			item += pname+" :";
			if(Box_L){
				item += "Box_L:"+numBox_L+"개,";
				totprice += discprice*numBox_L;
			}if(Box_M){
				item += "Box_M:"+numBox_M+"개,";
				totprice += discprice*numBox_M;
			}if(Box_S){
				item += "Box_S:"+numBox_S+"개,";
				totprice += discprice*numBox_S;
			}if(i<itemNum-1){
				item += ","
			}
			
			/*if($(".itam_"+i+".Box_L").is(":checked")){
				txt += ","+i+"눌림";
			}else{
				txt += ","+i+"안눌림";
			}*/
			
/*			if(i<$(".shopping .mainList .item ").length-1){
				if($(".shopping .mainList .item ")){
					
				}// 대 중 소 체크 된거만 받기위한 if
				if($(".shopping .mainList .item ")){}// 대 중 소 체크 된거만 받기위한 if
				if($(".shopping .mainList .item ")){}// 대 중 소 체크 된거만 받기위한 if
				
				item1 += $(".shopping .mainList .item ").eq(i).find(".item1").val()+",";//배열 첫번~마지막-1 값
			}else{
				item1 += $(".shopping .mainList .item ").eq(i).find(".item1").val();//배열 마지막값
			}*/
		}
		//console.log(item);
		console.log(Box_L);
		console.log(numBox_L);
		console.log(discprice);
		console.log(totprice);
		console.log(item);
		
		$("#item").val(item);
		console.log($("#item").val()+"<<<<");
		$("#price").val(totprice);
		console.log($("#price").val()+"<<<<");
		/*$("#item1").val(item1);
		console.log(item1);
		console.log($("#item1").val());
		$("#price").val(price);
		console.log(price);*/
		
		
    })
    
})