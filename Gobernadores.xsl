<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html"/>
  <xsl:template match="/">
    <html>
      <link rel="stylesheet" href="https://fonts.googleapis.com/css?Varela+Round"></link>
      <body>

        <style>
          body {
          font-family: 'Varela Round', sans-serif;
          background: rgb(0,212,255);
          background: linear-gradient(0deg, rgba(0,212,255,1) 0%, rgba(2,0,36,1) 100%);
          color: white;
          }
        </style>

        <center>
          <h1>REGISTRO DE VOTACIONES DEPARTAMENTALES</h1>
          <p>Los resultados de las votaciones en 6 departamentos de Colombia</p>

          <table bgcolor="#000" style="text-align:center; width: 1000px;">

            <tr bgcolor="#17202A">
              <th>Departamentos</th>
              <th>Inscritos</th>
              <th>Partido1</th>
              <th>Partido2</th>
              <th>Partido3</th>
              <th>Blanco</th>
              <th>Porcentaje Abstencion</th>
              <th>Cantidad letras</th>
            </tr> 

            <xsl:for-each select="//Votantes">
               <tr>
                <td>
                  <xsl:value-of select="Departamentos" />
                </td>
                <td>
                  <xsl:value-of select="Inscritos" />
                </td>
                <td>
                  <xsl:value-of select="Partido1" />
                </td>
                <td>
                  <xsl:value-of select="Partido2" />
                </td>
                <td>
                  <xsl:value-of select="Partido3" />
                </td>
                <td>
                  <xsl:value-of select="Blanco" />
                </td>
                <td>
                  <xsl:value-of select='format-number(((Blanco + Partido1 + Partido2 + Partido3 - Inscritos)*-1 div Inscritos), "#.0%")'/>
                
                </td>
                
                <xsl:if test="@region='andina'">
                  <td>
                    <xsl:value-of select=" string-length(Departamentos)"/> 
                  </td>
                </xsl:if>
              </tr>
            </xsl:for-each >
            
            <tr>
              <th >Totales</th>              
              <td></td>

              <td >
                <xsl:value-of select="sum(//Partido1/@value)" />
              </td>
              <td >
                <xsl:value-of select="sum(//Partido2/@value)" />
              </td>
              <td >
                <xsl:value-of select="sum(//Partido3/@value)" />
              </td>
            </tr>

            <th >Informe Caribe</th>
            <xsl:for-each select="//Votantes">

              <xsl:if test="@region='caribe'">

                <td>
                  <xsl:value-of select="Inscritos" />
                </td>

                <td>
                  <xsl:value-of select="Partido1" />
                </td>

                <td>
                  <xsl:value-of select="Partido2" />
                </td>
                <td>
                  <xsl:value-of select="Partido3" />
                </td>
                <td>
                  <xsl:value-of select="Blanco" />
                </td>
                <td>
                  <xsl:value-of select='format-number(((Blanco + Partido1 + Partido2 + Partido3 - Inscritos)*-1 div Inscritos), "#.0%")'/>
                </td>
              </xsl:if> <!--Fin condicional atributo caribe -->
            </xsl:for-each ><!--Fin ciclo informe caribe-->
          </table>
        </center>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
