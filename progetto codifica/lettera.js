function mostra() {   //mostra più dettagli lettera
		$(".blocco2").show();
		$("#mostra").hide();
		$("#nascondi").show();
};
		
			
function nascondi() {			//mostra meno dettagli lettera	
		$(".blocco2").hide();
		$("#nascondi").hide();
		$("#mostra").show();
};
		
		
//dopo il passaggio del mouse gli elementi della lettera si colorano.
function nonevidenzia (classe) {
    var a = document.getElementsByClassName(classe);
    for (var n of a)
        n.style.removeProperty("background-color");
};

//Al passaggio del mouse gli elementi della lettera si colorano.
function evidenzia (classe) {
    var a = document.getElementsByClassName(classe);
    for (var n of a)
        n.style.backgroundColor = "rgba(193,151,1,0.5)";
};



//nasconde o mostra seconda img 
function imgFirst()
{ 
	document.getElementById("LL1.17_folio_f").setAttribute("style", "display:block");
	document.getElementById("LL1.17_folio_r").setAttribute("style", "display:none");
	document.getElementById("letter-body").setAttribute("style", "display:block");
	document.getElementById("retro").setAttribute("style", "display:none");
};

//nasconde o mostra seconda img 
function imgSecond() 
{ 
	document.getElementById("LL1.17_folio_r").setAttribute("style", "display:block"); 
	document.getElementById("LL1.17_folio_f").setAttribute("style", "display:none");
	document.getElementById("retro").setAttribute("style", "display:block"); 
	document.getElementById("letter-body").setAttribute("style", "display:none");
};






