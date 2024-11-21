# TFG-SEIQR-model
TFG: "Simulación Numerica del modelo SEIQR. Aplicación a la pandemia de la Covid-19".

Abstract:

En este trabajo, se aborda el problema de formular modelos, basados en ecuaciones diferenciales parciales, que sean precisos y se ajusten a la
realidad de la pandemia de la COVID-19. En primera instancia, se expone un primer modelo
S-E-A-I-Q-R que incluye imposición de cuarentenas y distingue entre casos sintomáticos y asintomáticos,
después, se introduce un segundo modelo, más preciso, que también tiene en cuenta
retrasos en el aislamiento de individuos infectados y un proceso de vacunación. Se considerarán
dos versiones de este segundo modelo, una que es conservativa respecto a la población total, y otra
que no lo es. Finalmente, se procederá a la simulación numérica de los resultados ofrecidos por el
segundo modelo en sus dos versiones, para la cual la plataforma MATLAB será una herramienta
esencial. Se compararán los resultados obtenidos, y se analizará la estabilidad y sensibilidad de
la solución ante cambios en los valores numéricos de ciertos parámetros.

En este repositorio se encuentran los archivos que permiten la simulación numérica en MATLAB de los modelos S-E-A-I-Q-R con vacunaciones y retrasos en cuarentenas, y la realización de las gráficas que se discuten y comparan en mi TFG. Los datos sobre la población y los valores de los parámetros se han extraido de las referencias bibliográficas detalladas en la memoria del trabajo, que también he subido al repositorio.

Para su funcionamiento, basta con ejecutar Programacionmodelo.m que contiene llamadas a los demas archivos. Los scripts mas relevantes son los tres simuladores, uno para cada versión del modelo, y el que contiene los datos. El resto, se encargan de realizar las gráficas que aparecen en la memoria.
