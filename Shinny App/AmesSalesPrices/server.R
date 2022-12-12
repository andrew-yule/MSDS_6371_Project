#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

housesTrain = tibble(
  Neighborhood = c("BrkSide", "NAmes", "BrkSide", "NAmes", "NAmes", "NAmes", "NAmes", 
                   "BrkSide", "NAmes", "NAmes", "NAmes", "Edwards", "NAmes", "NAmes", 
                   "BrkSide", "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", 
                   "BrkSide", "NAmes", "NAmes", "NAmes", "NAmes", "Edwards", "Edwards", 
                   "NAmes", "Edwards", "Edwards", "NAmes", "NAmes", "NAmes", "NAmes", 
                   "NAmes", "NAmes", "NAmes", "NAmes", "Edwards", "BrkSide", "BrkSide", 
                   "Edwards", "NAmes", "Edwards", "NAmes", "NAmes", "Edwards", 
                   "Edwards", "BrkSide", "NAmes", "Edwards", "NAmes", "Edwards", 
                   "NAmes", "NAmes", "Edwards", "Edwards", "NAmes", "NAmes", "NAmes", 
                   "Edwards", "NAmes", "BrkSide", "NAmes", "NAmes", "NAmes", "Edwards", 
                   "NAmes", "BrkSide", "NAmes", "NAmes", "BrkSide", "Edwards", "NAmes", 
                   "Edwards", "NAmes", "NAmes", "NAmes", "BrkSide", "NAmes", "NAmes", 
                   "NAmes", "NAmes", "BrkSide", "NAmes", "NAmes", "Edwards", "BrkSide", 
                   "Edwards", "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", "Edwards", 
                   "Edwards", "Edwards", "Edwards", "NAmes", "BrkSide", "Edwards", 
                   "NAmes", "Edwards", "Edwards", "NAmes", "NAmes", "NAmes", "BrkSide", 
                   "Edwards", "Edwards", "BrkSide", "Edwards", "NAmes", "BrkSide", 
                   "NAmes", "NAmes", "Edwards", "NAmes", "NAmes", "NAmes", "NAmes", 
                   "BrkSide", "NAmes", "Edwards", "NAmes", "NAmes", "NAmes", "NAmes", 
                   "BrkSide", "Edwards", "NAmes", "Edwards", "BrkSide", "NAmes", 
                   "BrkSide", "Edwards", "NAmes", "NAmes", "BrkSide", "Edwards", 
                   "BrkSide", "NAmes", "Edwards", "Edwards", "NAmes", "NAmes", "NAmes", 
                   "NAmes", "NAmes", "NAmes", "Edwards", "BrkSide", "BrkSide", 
                   "BrkSide", "NAmes", "Edwards", "NAmes", "NAmes", "Edwards", "NAmes", 
                   "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", "BrkSide", "Edwards", 
                   "NAmes", "NAmes", "NAmes", "Edwards", "NAmes", "Edwards", "NAmes", 
                   "NAmes", "Edwards", "NAmes", "Edwards", "NAmes", "Edwards", "NAmes", 
                   "BrkSide", "BrkSide", "Edwards", "BrkSide", "BrkSide", "NAmes", 
                   "Edwards", "Edwards", "NAmes", "NAmes", "NAmes", "Edwards", 
                   "Edwards", "NAmes", "NAmes", "BrkSide", "Edwards", "Edwards", 
                   "NAmes", "NAmes", "NAmes", "NAmes", "BrkSide", "NAmes", "NAmes", 
                   "Edwards", "NAmes", "BrkSide", "NAmes", "NAmes", "NAmes", "Edwards",
                   "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", 
                   "NAmes", "Edwards", "NAmes", "NAmes", "Edwards", "NAmes", "NAmes", 
                   "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", "BrkSide", 
                   "Edwards", "NAmes", "Edwards", "NAmes", "NAmes", "BrkSide", 
                   "Edwards", "NAmes", "NAmes", "Edwards", "BrkSide", "NAmes", "NAmes", 
                   "NAmes", "BrkSide", "BrkSide", "Edwards", "NAmes", "Edwards", 
                   "NAmes", "BrkSide", "NAmes", "Edwards", "NAmes", "Edwards", "NAmes", 
                   "Edwards", "NAmes", "NAmes", "Edwards", "Edwards", "Edwards", 
                   "NAmes", "Edwards", "NAmes", "NAmes", "NAmes", "NAmes", "Edwards", 
                   "Edwards", "NAmes", "NAmes", "Edwards", "NAmes", "NAmes", "NAmes",
                   "BrkSide", "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", 
                   "Edwards", "Edwards", "NAmes", "BrkSide", "NAmes", "BrkSide", 
                   "NAmes", "Edwards", "BrkSide", "NAmes", "Edwards", "NAmes", "NAmes", 
                   "Edwards", "NAmes", "Edwards", "Edwards", "NAmes", "BrkSide", 
                   "NAmes", "Edwards", "NAmes", "BrkSide", "NAmes", "NAmes", "NAmes", 
                   "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", "NAmes", 
                   "NAmes", "Edwards", "BrkSide", "Edwards", "NAmes", "NAmes", 
                   "BrkSide", "NAmes", "NAmes", "Edwards", "NAmes", "BrkSide", "NAmes", 
                   "Edwards", "NAmes", "NAmes", "Edwards", "Edwards", "NAmes", 
                   "Edwards", "Edwards", "NAmes", "Edwards", "NAmes", "BrkSide", 
                   "BrkSide", "Edwards", "Edwards", "NAmes", "NAmes", "NAmes", 
                   "BrkSide", "NAmes", "NAmes", "NAmes", "NAmes", "Edwards", "Edwards", 
                   "NAmes", "Edwards", "BrkSide", "NAmes", "NAmes", "BrkSide", "NAmes", 
                   "BrkSide", "NAmes", "NAmes", "BrkSide", "NAmes", "Edwards", "NAmes", 
                   "NAmes", "NAmes", "NAmes", "NAmes", "BrkSide", "Edwards", "NAmes", 
                   "Edwards", "NAmes", "Edwards"),
  GrLivArea = c(1077,1253,854,1004,1339,900,1600,520,1700,1297,1057,1152,1324,1150,1176,1360,1425,2207,2223,1086,952,1285,2142,1065,1040,1235,960,835,1225,1855,1125,1080,1348,1053,2157,1327,1214,864,1385,1709,875,1344,1096,1040,1355,1656,1362,2158,1340,1252,1479,1709,3112,1121,1100,1092,864,1212,1236,864,1194,1487,1375,1306,1302,1314,1382,1113,1632,1548,1734,858,1396,1716,1644,861,972,2978,1383,2134,1728,1056,1215,1040,1577,958,1478,1111,1505,1922,1394,1431,1268,1287,1319,904,1184,1125,1367,882,788,1144,1812,1276,1134,1056,1196,907,904,1196,1440,1573,1689,1888,1203,1277,1644,1072,1113,1073,1578,1269,1820,912,1214,1041,1363,864,1244,1664,4676,928,605,1362,827,334,1347,864,767,1635,1126,1048,1092,996,1674,943,1728,864,1109,1216,1429,816,1573,838,935,1986,2008,1054,832,864,1116,1422,1520,2080,1350,1056,800,796,2704,981,1048,1094,1839,1510,1053,1458,1486,1392,1181,2380,1369,1136,1539,616,1148,729,960,864,1470,1698,864,1776,1040,1200,1529,1026,864,1301,1220,1117,912,773,1128,980,1576,1086,1442,1250,1008,784,1392,1516,1144,1200,1165,1800,1445,1148,1002,894,910,1268,1090,892,1712,1393,2217,1505,924,1796,858,1306,1063,2274,1015,1229,1414,2200,925,2069,747,1440,1144,864,980,858,1098,1095,1192,2019,869,894,999,1164,1851,1230,1050,944,1657,1664,1082,1132,1264,1376,845,1733,930,1977,1526,1154,1611,893,1048,1456,1426,1096,1251,1709,1040,1200,936,1324,950,1134,1194,816,1008,1040,960,698,1005,986,1252,1167,952,924,1576,932,1466,1820,1265,2108,1261,1124,1221,864,1348,1283,672,999,912,912,1846,2136,1138,912,1507,1190,1224,1188,988,2110,1656,1367,864,1054,1050,1824,1337,1524,1357,1920,1412,1152,864,1052,1128,1072,5642,1246,1708,948,2112,948,1478,720,708,774,816,872,2634,1716,1176,892,1078,1738,1661,1604,864,2117,1258,1218,1584,900,1513,1904,1158,1668,1040,1848,1144,2201,1344,1252,1558,1537,864,952,1346,1792,1072,1078,1256),
  SalePrice = c(118000,157000,132000,149000,139000,134800,207500,68500,165500,153000,109000,82000,160000,141000,114500,130000,180500,180000,244000,144900,135750,127000,193500,126500,109900,98600,94750,83000,128950,136900,155000,136000,155000,150000,226000,150750,143000,115000,166000,130000,105000,115000,79000,109500,127500,215000,163000,243000,120000,127000,184000,130000,235000,140000,141000,145000,98000,186000,134450,97000,148000,113000,140000,76500,158000,145000,176000,148000,139000,205000,159000,88000,153575,131000,167000,82500,132000,242000,145250,214500,119000,139000,155000,87500,140200,151500,157500,95000,145000,198500,159000,165000,132000,162000,123000,61000,81000,125000,119000,106500,100000,129000,169500,60000,126000,142000,139000,109008,119000,110000,118000,162900,127500,190000,110000,167000,146500,148000,147000,156000,133000,155000,184000,120000,140000,124500,164900,129900,150000,159000,184750,132000,86000,128000,107500,39300,107500,111250,133000,210000,108000,113000,141000,108000,185000,135960,142600,120000,139000,118500,181900,118500,133000,130000,79500,205000,225000,137500,105500,67000,160000,139900,153000,135000,168500,139400,60000,85000,345000,143250,98300,155000,155000,108000,145500,97500,167000,110000,137500,129000,103600,140000,141500,89000,123500,52000,129000,124500,135000,320000,120500,110000,93500,179000,98000,156000,127500,100000,102000,107000,114500,110000,118000,135500,223500,159950,157900,116000,137000,109500,166000,167000,139950,130500,174900,141000,158000,132500,148500,109500,116000,133000,157000,100000,145000,135500,268000,149500,122900,140000,110000,153000,128000,154300,88000,135000,176500,145900,117500,242000,79900,150000,143000,129000,127500,116500,135000,140000,135000,167500,85500,110000,178400,125000,187000,121600,136500,82000,163500,100000,119200,176000,167500,105000,84000,139600,84900,165000,144500,154000,167900,135000,135000,91500,159500,138800,160000,137500,92900,146000,129000,128000,119500,135000,159500,129900,134500,133700,112000,118000,115000,102000,119000,144000,139000,80000,149000,124000,149900,201800,179900,235000,163000,93000,104900,116050,117000,140000,113000,134500,80500,115000,143000,137900,145000,147000,127000,132500,101800,142000,119000,244000,165400,127500,99900,151000,128900,180500,181000,144000,177000,137000,132500,180500,115000,138500,155000,140000,160000,154000,130000,119000,206900,111000,156500,72500,82500,79000,100000,123000,200000,171000,134900,110000,149900,104900,165500,117000,58500,237500,105000,131000,124000,123000,137500,138000,120000,140000,90000,207000,124000,274970,144000,142000,140000,174000,120500,121000,112000,136000,145000,142125,147500)
)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$plot <- renderPlot({

        # Get data for just one neighborhood
        temp = housesTrain |>
          filter(Neighborhood == input$neighborhood)

        # Draw plot
        temp |>
          ggplot(aes(x = GrLivArea, y = SalePrice)) +
          geom_point()
    })
})
