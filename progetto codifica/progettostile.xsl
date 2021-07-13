<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
  
<xsl:template match="/">
  <html>
    <head>
      <title>Progetto Codifica Testi Gabriele Ciardi</title>
      <script src="lettera.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <link rel="stylesheet" href="stile.css" />
      <link href="https://fonts.googleapis.com/css2?family=Merriweather+Sans:wght@300"/>
    </head>
    <body>
      <h1>Lettera LL1.17</h1>
      <xsl:apply-templates /> 
    </body>
  </html> 
</xsl:template>
  
<!-- responsabile trascrizione -->

<xsl:template match="//tei:titleStmt"> 
  <div class="blocco">
    <h2> 
      <xsl:value-of select="tei:title"/>
    </h2>
    <h3> 
      <xsl:value-of select="//tei:resp[@xml:id='first']"/>   
    </h3>
    <p> 
      <xsl:value-of select="//tei:name[@ref='#GS']"/>   
    </p>
  </div>
</xsl:template> 
 
<!-- edizione -->  
<xsl:template match="//tei:edition">
  <div class="blocco">
    <h3>Edizione</h3> 
    <p><xsl:apply-templates/></p>
  </div>
</xsl:template> 

<!-- responsabili -->
<xsl:template match="//tei:respStmt">
  <div class="blocco">
    <h3><xsl:value-of select="tei:resp"/></h3>
      <xsl:for-each select="tei:name">
        <p>
          <xsl:value-of select="."/>
        </p>
      </xsl:for-each>
  </div>
</xsl:template> 
  
<!-- pubblicazione-->
<xsl:template match="//tei:publicationStmt">
  <div class="blocco">
    <h3>Pubblicazione e distribuzione</h3>
    <p class="titolo2"><xsl:value-of select="tei:publisher"/></p>
    <p>Licenza:<xsl:value-of select="tei:availability"/></p>
  </div>
</xsl:template> 
 
<!-- collocazione manoscritto-->
<xsl:template match="//tei:msIdentifier">
  <div class="blocco">
    <h3>Collocazione del manoscritto</h3>
      <p><xsl:value-of select="tei:country"/>, <xsl:value-of select="tei:settlement"/></p>
      <p><xsl:value-of select="tei:repository"/></p>
      <p>Codice: <xsl:value-of select="tei:idno"/></p>
      <p>Collocazione: <xsl:value-of select="tei:altIdentifier"/></p>
  </div>
</xsl:template> 
  
<!-- dati manoscritto -->
<xsl:template match="//tei:msItem">
  <button id="mostra" onclick="mostra()">Mostra più informazioni</button>
  <div hidden="hidden" class="blocco2">
    <h2>Dati manoscritto</h2>
    <p>Autore: <xsl:value-of select="tei:author"/></p>
    <p>Destinatario: <xsl:value-of select="//tei:persName[@ref='#VVD']"/></p>
    <p>Data: <xsl:value-of select="tei:title//tei:date"/></p>
    <p>Lingua: <xsl:value-of select="tei:textLang"/></p>  
    <p>Materiale: <xsl:value-of select="//tei:material"/></p>
    <p>Dimensioni: <xsl:value-of select="//tei:height"/>x<xsl:value-of select="//tei:width"/>mm</p>
  </div>
</xsl:template> 
 
<!-- descrizione mani e condizione lettera-->
 
<xsl:template match="//tei:physDesc"> 
  <div hidden="hidden" class="blocco2">
    <h2>Descrizione manoscritto</h2>
    <p><xsl:value-of select="//tei:p"/><xsl:value-of select="//tei:foliation"/></p>
    <p><xsl:value-of select="//tei:handNote"/></p>
</div>
</xsl:template> 
  
<!-- note bibliografiche-->
<xsl:template match="//tei:additional">
  <div hidden="hidden" class="blocco2">
    <h3>Note</h3>
    <p><xsl:apply-templates/></p>
  </div>
</xsl:template> 
 
<!-- informazioni aggiuntive-->
  
<xsl:template match="//tei:profileDesc">
  <div hidden="hidden" class="blocco2">
    <h3>Informazioni aggiuntive</h3>
    <p><xsl:apply-templates/></p>
    <p>Tipologia: <xsl:value-of select="//tei:term"/> scritta in <xsl:value-of select="//tei:langUsage"/></p>
  </div>
  <button hidden="hidden" id="nascondi"  onclick="nascondi()">Mostra meno informazioni</button>
  
<!-- introduzione lettera -->
  
  <div class="int">
    <h2>Testo Lettera <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:idno"/><a href="#LL1.17_nota1"><sub>45</sub></a></h2> 
    <h3><xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:title"/><a href="#LL1.17_nota2"><sub>46</sub></a></h3>
    <h4>"Passa sopra gli elementi della lettera con il mouse"</h4> 
  </div>
</xsl:template>

<!-- Lista persone e luoghi -->
  
<xsl:template match="tei:listPerson">
  <div hidden="hidden" class="blocco2">
    <h3><xsl:value-of select="//tei:head"/></h3>
        <xsl:for-each select="//tei:person">
          Nome: <xsl:value-of select="tei:persName/tei:forename"/>
          <br/>
          Cognome: <xsl:value-of select="tei:persName/tei:surname"/>
          <br/>
          Alias: <xsl:value-of select="tei:persName//tei:addName"/>
          <br/>
          Titolo onorario: <xsl:value-of select="tei:persName/tei:roleName"/>
          <br/>
          Nascita: <xsl:value-of select="tei:birth"/>
          <br/>
          Morte: <xsl:value-of select="tei:death"/>
          <br/><br/> 
        </xsl:for-each>   
  </div>
</xsl:template>
  
<xsl:template match="//tei:listPlace">
  <div hidden="hidden" class="blocco2">
    <h3><xsl:value-of select="//tei:listPlace//tei:head"/></h3>
        <xsl:for-each select="//tei:place">
          Luogo: <xsl:value-of select="//tei:listPlace//tei:placeName"/>
          <br/>
          Nazione: <xsl:value-of select="//tei:listPlace//tei:country"/>
          <br/>
        </xsl:for-each>      
  </div>
</xsl:template>
  
 <!-- creo corpo e bibliografia -->
  
<xsl:template match="tei:s">
  <span>
    <xsl:attribute name="id"><xsl:value-of select="current()/@xml:id"/></xsl:attribute>
    <xsl:attribute name="class">sentence</xsl:attribute>
    <xsl:apply-templates/>
  </span>
</xsl:template>
 
<xsl:template match="tei:lb">
  <br/>
  <span>
    <xsl:attribute name="class"><xsl:value-of select="@xml:id"/></xsl:attribute>
    <xsl:attribute name= "onmouseover">evidenzia('<xsl:value-of select="@xml:id"/>')</xsl:attribute>
    <xsl:attribute name= "onmouseout">nonevidenzia('<xsl:value-of select="@xml:id"/>')</xsl:attribute>
      [&#x2022;] 
  </span>
 <xsl:apply-templates/>  
</xsl:template>
  
<xsl:template match="tei:fw">
  <br/>
  <span>
    <xsl:attribute name="class"><xsl:value-of select="@xml:id"/></xsl:attribute>
    <xsl:attribute name= "onmouseover">evidenzia('<xsl:value-of select="@xml:id"/>')</xsl:attribute>
    <xsl:attribute name= "onmouseout">nonevidenzia('<xsl:value-of select="@xml:id"/>')</xsl:attribute>
     [&#x2022;] 
  </span>
 <xsl:apply-templates/>
</xsl:template>

<xsl:template match="tei:ab[@n='2']/tei:unclear">
  <br/>
  <span>
    <xsl:attribute name="class"><xsl:value-of select="@xml:id"/></xsl:attribute>
    <xsl:attribute name= "onmouseover">evidenzia('<xsl:value-of select="@xml:id"/>')</xsl:attribute>
    <xsl:attribute name= "onmouseout">nonevidenzia('<xsl:value-of select="@xml:id"/>')</xsl:attribute>
    [&#x2022;] 
  </span>
  <xsl:apply-templates/>
</xsl:template>
  
<!-- attribuisco div a corpo lettera -->
  
<xsl:template match="tei:div">  
  <div class="int">
    <xsl:attribute name="id"><xsl:value-of select="current()/@type"/></xsl:attribute>
    <xsl:apply-templates/>
  </div>
</xsl:template>
  
<!-- creo immagini e collegamento con testo -->
  
<xsl:template match="tei:surface">
  <div class="img" > 
    <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
    <img id="img1" onload="imgFirst()" width="100%"><xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute></img>
      <xsl:variable name = "n"><xsl:value-of select = "@n"/></xsl:variable>
      <xsl:for-each select = "//tei:surface[@n=$n]//tei:zone">
        <xsl:variable name = "x">
          <xsl:value-of select = "@ulx"/>
        </xsl:variable>
        <xsl:variable name = "width">
          <xsl:value-of select = "translate(..//tei:graphic/@width,'px','')"/>
        </xsl:variable>
        <xsl:variable name = "height">
          <xsl:value-of select = "translate(..//tei:graphic/@height,'px','')"/>
        </xsl:variable>
        <xsl:variable name = "y">
          <xsl:value-of select = "@uly"/>
        </xsl:variable>
        <xsl:variable name = "ly">
          <xsl:value-of select = "@lry"/>
        </xsl:variable>
        <xsl:variable name = "lx">
          <xsl:value-of select = "@lrx"/>
        </xsl:variable>
      <a>
        <xsl:attribute name = "onmouseover">evidenzia('<xsl:value-of select="@xml:id"/>_lb')</xsl:attribute>
        <xsl:attribute name = "onmouseout">nonevidenzia('<xsl:value-of select = "@xml:id"/>_lb')</xsl:attribute>
        <xsl:attribute name = "class"><xsl:value-of select = "@xml:id"/>_lb</xsl:attribute>
        <xsl:attribute name = "href">#<xsl:value-of select = "@xml:id"/>_lb</xsl:attribute>
        <xsl:attribute name = "title"><xsl:value-of select = "@rendition"/></xsl:attribute>
          <xsl:attribute name="style">
          position:absolute; left:<xsl:value-of select ="$x * 100 div $width"/>%;
          top:<xsl:value-of select ="$y * 100 div $height"/>%;
          width:<xsl:value-of select = "($lx - $x) * 100 div $width"/>%;
          height:<xsl:value-of select = "($ly - $y) * 100 div $height"/>%;
          z-index:1;
        </xsl:attribute>
      </a>  
    </xsl:for-each>
    <h3>Clicca sui tasti per visualizzare fronte e retro</h3>
    <button id="btfronte" hidden="hidden" class="cambia" onclick="imgFirst(this)">Fronte</button>
    <button id="btretro" class="cambia" onclick="imgSecond(this)">Retro</button>
  </div>        
</xsl:template>
  
<!-- creo bibliografia e note --> 
  
<xsl:template match="//tei:back">
  <div class="int">
    <h2><xsl:value-of select="//tei:div[@type='notes']/tei:head"/></h2> 
      <xsl:for-each select="//tei:div[@type='notes']/tei:note">
        <li>
          <xsl:attribute name="id"><xsl:value-of select="current()/@xml:id"/>
          </xsl:attribute><xsl:apply-templates/><br/>
        </li>
      </xsl:for-each>
  </div>

  <div class="int">
  <h2><xsl:value-of select="//tei:listBibl/tei:head"/></h2>
      <xsl:for-each select="//tei:listBibl/tei:bibl">
        <li><xsl:value-of select="."/></li>
      </xsl:for-each>
  </div>
</xsl:template>
  
</xsl:stylesheet>