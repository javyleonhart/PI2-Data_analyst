# Proyecto individual 2 - Data analyst

## Tema: Siniestro viales fatales en la Ciudad Autónoma de Buenos Aires

![](/imgs/img1.jpg)
![](/imgs/img2.jpg)

## **Presentación**

En el presente proyecto se nos encomienda, como analista de datos, investigar sobre los homicidios provocados por siniestro viales en la Ciudad Autónoma de Buenos Aires (CABA). Vamos a explorar las distintas causas de los accidentes de tránsito y generar eventuales soluciones para reducir las tasas de mortalidad producidas por este tipo de accidentes. En Argentina hay más probabilidades de morir en un accidente de tránsito que en un delito. El Gobierno de CABA planteó ciertos objetivos para lograr esta meta, lo cuales los mencionaremos más adelante. Para comenzar, nos preguntamos

### **¿Qué sabemos sobre los homicidios por siniestro viales en CABA?**

Según los datos dispuesto por el mismo gobierno, podemos decir que entre 2016 y 2021 se encuentran registrados un total de 696 accidentes que culminaron con al menos una muerte y un total de 717 víctimas de las mismas. De ese total, podemos constatar que alrededor del 76% de las víctimas fueron hombres y el 23% mujeres (el porcentaje restante no contiene registros). Esto se puede deber a que generalmente son hombres los contratados para el manejo de transportes públicos y de cargas. También, la distribución de las edades de las mismas va desde los 4 años hasta los 95, pero encontramos la mayor concentración de valores entre los 20 y los 30 años (los 0 hacen referencia a los datos sin registro). Esto se puede asociar a una imprudencia por parte de los jóvenes a la hora de manejar.


![](/imgs/grafico1.png)
![](/imgs/grafico2.png)
![](/imgs/grafico9.png)


Podemos decir que el 63% del total ocurrió en avenidas, el 19% en calles y el 18% restante en autopistas. De estos registros también notamos que, generalmente, en el último trimestre del año hay una suba en la cantidad de accidentes, lo cual podríamos suponer que se debe contexto de las fiestas de fin de año y vacaciones y/o a la acumulación de estrés por los sucesos del año (que desde el punto de vista lógico no tendría mucho sentido, pero suele haber una percepción social de “cambio” en el pasaje de un año a otro y de “relajación” luego de las fiestas).


![](/imgs/grafico3.png)
![](/imgs/grafico12.png)


En el siguiente gráfico podemos identificar que la mayor cantidad de accidentes suceden entre las 5 y las 10 de la mañana, lo que coincide con la primera hora pico del día en día laboral por el traslado de la población, ya sea al trabajo o a la escuela, y en los fines de semana con el cierre de los boliches, pubs, bares y afines, lo que hace más propenso encontrar gente al volante en condiciones inadecuadas para conducir.


![](/imgs/grafico4.png)


También se descubrió que los participantes más frecuentes en estos accidentes fatales son, en el orden de victima-acusado, Peatón-Pasajeros (en rol de acusado, entendemos por pasajeros como transporte público como colectivo y ómnibus de larga distancia), Moto-Auto, Moto-Cargas.


![](/imgs/grafico5.png)


Si vemos los hechos por años, vamos a poder observar que el promedio se puede encontrar cerca de los 137 casos al año entre 2016 y 2018. En los años siguientes, ese promedio baja. Aunque es importante destacar que en 2020 el mundo se encontró en situación de pandemia y Argentina recurrió como medida provisoria de urgencia a decretar una cuarentena casi total, donde solo los operarios de servicios básico estaban autorizados de circular por las calles. Esta etapa de aislamiento duro aproximadamente 4 meses, por lo que es entendible que la cantidad de este tipo de accidentes haya disminuido tanto ese año.


![](/imgs/grafico6.png)


Una vez observados estos datos generales cabe preguntarnos:

### **¿En dónde ocurren estos hechos? ¿En qué comunas? ¿Hay alguna calle donde sean más frecuentes? ¿Cuáles son las principales víctimas?**

Para responder a todo esto, vamos a empezar diciendo que la mayor cantidad de accidentes se encuentran en las comunas 1, 4, 9, 8 y 7. Para la comuna 1 hay que tener en cuenta que en retiro se encuentra la terminal de ómnibus, lo que nos indica que hay gran afluencia de colectivos y por lo tanto más tránsito. Con respecto a la 4, 9 y 8 resaltamos que todas ellas conforman lo que es la Zona Sur del gran Buenos Aires.


![](/imgs/grafico7.png)


Si vemos las calles, observamos que la Av. General Paz es la que se lleva la mayor cantidad de accidentes, contando con casi la mitad de todos los casos registrados en autopistas. Está calle forma parte de la Ruta Nacional A001 y divide Capital de Provincia. Ésta es la calle con mayor caudal de tránsito de todas las rutas nacionales del país. De las Avenidas, podemos destacar la Rivadavia y Del Libertador, aunque sus casos están distribuidos y no se puede identificar un foco particular.


![](/imgs/grafico8.png)
![](/imgs/grafico10.png)


Luego, si observamos las víctimas, vemos que la gran mayoría de ellas son motociclistas y peatones. El uso de motos viene en alza a nivel nacional por lo que se entiende que hay cada vez más usuarios. Según la asociación civil “Luchemos por la Vida” 4 de cada 10 fallecidos en siniestros viales fueron motociclistas.


![](/imgs/grafico11.png)


Por último, mencionamos qué si bien la mayoría de los accidentes suceden en avenidas, en las autopistas todos los casos se distribuyen solamente en 5 lugares, por lo que en proporción son lugares más propensos para accidentes


![](/imgs/mapa1.png)


Todo esto nos lleva a plantearnos objetivos y generar soluciones para disminuir estos valores. Como primer objetivo nos planteamos disminuir en un 10% la tasa de homicidios en siniestro viales en el último semestre con respecto al anterior. Podemos ver que este objetivo se cumplió ya que se disminuyó un 15% con respecto al último semestre. De todos modos, planteamos objetivos para el siguiente semestre entre los cuales podemos considerar:

    •	El despliegue de agentes de tránsito en las calles con más afluencia durante el periodo de 5 a 10 am que es donde hay mayor concentración de hechos

    •	Intensificar los operativos y controles durante el último trimestre del año

    •	Mayor exigencia en la expedición de licencias y controles rigurosos en Zona Sur

    •	Mas controles en las principales arterias de la comuna 1 (Av. 9 de Julio y Leandro Alem)


![](/imgs/kpi1.png)


El segundo objetivo que nos planteamos es el reducir la cantidad de muertes de motociclistas en siniestros viales en un 7% con respecto al año anterior. Acá notamos que el objetivo quedó muy por encima, ya que en el último año la cantidad de accidentes subió en un 83%. Para lograr reducir esto para el siguiente año se propone:

    •	Lanzamiento de una campaña de concientización sobre el manejo responsable y el uso de casco y chaleco refractario, dirigido sobre todo a la población entre 20 y 35 años.

    •	Aumentar los controles en las comunas donde se registren mayor cantidad de ventas de motocicletas


![](/imgs/kpi2.png)


Por último, si vemos los accidentes en la General Paz, notamos que la mayoría se llevó a cabo en la noche y en los fines de semana. Esto se debe principalmente a que, culturalmente, en esos periodos se sale a bailar y es costumbre el consumo de alcohol excesivo o al menos peligroso cuando se trata de manejar, lo que coincide también con el rango de edad de las victimas como vimos antes. Entonces, nos proponemos bajar un 15% la cantidad de accidentes mortales en la General Paz con respecto al año anterior. **Para esto, se propone la implementación de controles policiales y de alcoholemia en las zonas de la General Paz que suelen ser focos de este tipo de accidentes.**


![](/imgs/mapa2.png)



## Conclusiones

*	La causa de accidentes viales mortales es multifactorial, pero se encuentran ciertos patrones como la hora en que suceden (la mañana), la edad más frecuente (20-35), el trimestre donde aumentan (4°) o el tipo de calle donde más suceden (Avenidas)

*	Motociclistas y peatones son las victimas más frecuentes

*	La comuna 1 y zona sur de Buenos Aires son los lugares con mayor cantidad

*	La General Paz es la calle con mayor cantidad de accidentes

*	Aumentar los controles, aumentar la exigencia en los exámenes y el lanzamiento de campañas sobre manejo responsable en las zona y focos indicados son las soluciones propuestas.

## Tecnología utilizada

* Python
* Pandas
* MySQL
* MySQL Workbench
* Matplotlib
* Seaborn
* Power BI

## Elementos del repositorio

* SQLquerys.sql: script de mysql donde se crea la base de datos, se cargan los csv y se les hace un ligero tratamiento para cargarlos dentro de Power BI
* EDA.ipynb: Analisis exploratorio de los datos de la BD
* hechos.csv/victimas.csv/comunas.csv: Datos con los cuales se trabajaron
* Dashboard.pbix: Dashboard diseñado para la exposición de este trabajo
* Carpeta imgs: imagenes utilizadas para este readme
