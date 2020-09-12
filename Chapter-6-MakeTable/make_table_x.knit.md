---
title: "Making Tables with `gt`"
author: "AECN 396/896-002"
output:
  xaringan::moon_reader:
    # css: [default, metropolis, metropolis-fonts] 
    css: xaringan-themer.css 
    lib_dir: libs
    nature:
      ratio: 16:10
      highlightStyle: github
      highlightLines: true
      countIncrementalSlides: false
---










<style type="text/css">

.remark-slide th {
  border-bottom: 1px solid #ddd;
}

.remark-slide thead {
  border-bottom: 0px;
}

.gt_footnote {
  padding: 2px;  
}

.remark-slide table {
  border-collapse: collapse;
}

.remark-slide tbody {
  border-bottom: 2px solid #666;
}


.important {
  background-color: lightpink;
  border: 2px solid blue;
  font-weight: bold;
} 

.remark-code {
  display: block;
  overflow-x: auto;
  padding: .5em;
  background: #ffe7e7;
} 

.hljs-github .hljs {
  background: #f2f2fd;
}

.remark-inline-code {
  padding-top: 0px;
  padding-bottom: 0px;
  background-color: #e6e6e6;
}

.r.hljs.remark-code.remark-inline-code{
  font-size: 0.9em
}

.left-full {
  width: 80%;
  height: 92%;
  float: left;
}

.left-code {
  width: 38%;
  height: 92%;
  float: left;
}

.right-plot {
  width: 60%;
  float: right;
  padding-left: 1%;
}

.left5 {
  width: 49%;
  height: 92%;
  float: left;
}

.right5 {
  width: 49%;
  float: right;
  padding-left: 1%;
}

.left4 {
  width: 38%;
  height: 92%;
  float: left;
}

.right6 {
  width: 60%;
  float: right;
  padding-left: 1%;
}

ul li{
  margin: 7px;
}

ul, li{
  margin-left: 15px; 
  padding-left: 0px; 
}

ol li{
  margin: 7px;
}

ol, li{
  margin-left: 15px; 
  padding-left: 0px; 
}

</style>

<style type="text/css">
.content-box { 
    box-sizing: border-box;
    background-color: #e2e2e2;
}
.content-box-blue,
.content-box-gray,
.content-box-grey,
.content-box-army,
.content-box-green,
.content-box-purple,
.content-box-red,
.content-box-yellow {
  box-sizing: border-box;
  border-radius: 15px;
  margin: 0 0 15px;
  overflow: hidden;
  padding: 0px 20px 0px 20px;
  width: 100%;
}
.content-box-blue { background-color: #F0F8FF; }
.content-box-gray { background-color: #e2e2e2; }
.content-box-grey { background-color: #F5F5F5; }
.content-box-army { background-color: #737a36; }
.content-box-green { background-color: #d9edc2; }
.content-box-purple { background-color: #e2e2f9; }
.content-box-red { background-color: #ffcccc; }
.content-box-yellow { background-color: #fef5c4; }
.content-box-blue .remark-inline-code,
.content-box-blue .remark-inline-code,
.content-box-gray .remark-inline-code,
.content-box-grey .remark-inline-code,
.content-box-army .remark-inline-code,
.content-box-green .remark-inline-code,
.content-box-purple .remark-inline-code,
.content-box-red .remark-inline-code,
.content-box-yellow .remark-inline-code { 
  background: none;
}

.full-width {
    display: flex;
    width: 100%;
    flex: 1 1 auto;
}
</style>


<style type="text/css">
blockquote, .blockquote {
  display: block;
  margin-top: 0.1em;
  margin-bottom: 0.2em;
  margin-left: 5px;
  margin-right: 5px;
  border-left: solid 10px #0148A4;
  border-top: solid 2px #0148A4;
  border-bottom: solid 2px #0148A4;
  border-right: solid 2px #0148A4;
  box-shadow: 0 0 6px rgba(0,0,0,0.5);
  /* background-color: #e64626; */
  color: #e64626;
  padding: 0.5em;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
}

.blockquote p {
  margin-top: 0px;
  margin-bottom: 5px;
}
.blockquote > h1:first-of-type {
  margin-top: 0px;
  margin-bottom: 5px;
}
.blockquote > h2:first-of-type {
  margin-top: 0px;
  margin-bottom: 5px;
}
.blockquote > h3:first-of-type {
  margin-top: 0px;
  margin-bottom: 5px;
}
.blockquote > h4:first-of-type {
  margin-top: 0px;
  margin-bottom: 5px;
}

.text-shadow {
  text-shadow: 0 0 4px #424242;
}
</style>

<style type="text/css">
/******************
 * Slide scrolling
 * (non-functional)
 * not sure if it is a good idea anyway
slides > slide {
  overflow: scroll;
 padding: 5px 40px;
}
.scrollable-slide .remark-slide {
  height: 400px;
  overflow: scroll !important;
}
 ******************/

.scroll-box-8 {
  height:8em;
  overflow-y: scroll;
}
.scroll-box-10 {
  height:10em;
  overflow-y: scroll;
}
.scroll-box-12 {
  height:12em;
  overflow-y: scroll;
}
.scroll-box-14 {
  height:14em;
  overflow-y: scroll;
}
.scroll-box-16 {
  height:16em;
  overflow-y: scroll;
}
.scroll-box-18 {
  height:18em;
  overflow-y: scroll;
}
.scroll-box-20 {
  height:20em;
  overflow-y: scroll;
}
.scroll-box-24 {
  height:24em;
  overflow-y: scroll;
}
.scroll-box-30 {
  height:30em;
  overflow-y: scroll;
}
.scroll-output {
  height: 90%;
  overflow-y: scroll;
}

 
</style>



# Before you start

## Learning objectives

The objectives of this chapter is to learn how to use the `ggplot2` package to create figures for effective communication 

## Table of contents

1. [`ggplot2` basics](#ggplot2-basics)
2. [Different types of figures](#dif-geoms)
3. [Placing more information in one figure](#more-info)
4. [Faceted figures](#faceting)
5. [Other supplementary `geom_*()`](#other-geoms)
6. [Make your figures presentable to others](#fine-tune)
7. [Tips](#tips)
7. [Gallery of other type of figures](#gallery)
7. [Animated figures](#animated)

<br>

<span style="color:red"> Tips: </span>hitting "o" key will give you a panel view of the slides


<!-- 
#=========================================
# gt Basics
#=========================================
-->

---

class: inverse, center, middle
name: more-info

# Create awesome tables with the `gt` package 

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=1000px></html>

---






count: false
 
# Taste of the gt package
.panel1-taste-gt-user[

```r
*sp500_data
```
]
 
.panel2-taste-gt-user[

```
## # A tibble: 10 x 6
##    date        open  high   low close     volume
##    <date>     <dbl> <dbl> <dbl> <dbl>      <dbl>
##  1 2010-06-15 1091. 1116. 1091. 1115. 4644490000
##  2 2010-06-14 1095  1106. 1089. 1090. 4425830000
##  3 2010-06-11 1083. 1092. 1077. 1092. 4059280000
##  4 2010-06-10 1059. 1088. 1059. 1087. 5144780000
##  5 2010-06-09 1063. 1078. 1052. 1056. 5983200000
##  6 2010-06-08 1051. 1063. 1042. 1062  6192750000
##  7 2010-06-07 1066. 1071. 1050. 1050. 5467560000
##  8 2010-06-04 1098. 1098. 1060. 1065. 6180580000
##  9 2010-06-03 1099. 1106. 1092. 1103. 4995970000
## 10 2010-06-02 1073. 1099. 1072. 1098. 5026360000
```
]

---
count: false
 
# Taste of the gt package
.panel1-taste-gt-user[

```r
sp500_data %>%
* gt()
```
]
 
.panel2-taste-gt-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#iygvvcniwa .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#iygvvcniwa .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#iygvvcniwa .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#iygvvcniwa .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#iygvvcniwa .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#iygvvcniwa .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#iygvvcniwa .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#iygvvcniwa .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#iygvvcniwa .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#iygvvcniwa .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#iygvvcniwa .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#iygvvcniwa .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#iygvvcniwa .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#iygvvcniwa .gt_from_md > :first-child {
  margin-top: 0;
}

#iygvvcniwa .gt_from_md > :last-child {
  margin-bottom: 0;
}

#iygvvcniwa .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#iygvvcniwa .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#iygvvcniwa .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#iygvvcniwa .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#iygvvcniwa .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#iygvvcniwa .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#iygvvcniwa .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#iygvvcniwa .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#iygvvcniwa .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#iygvvcniwa .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#iygvvcniwa .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#iygvvcniwa .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#iygvvcniwa .gt_left {
  text-align: left;
}

#iygvvcniwa .gt_center {
  text-align: center;
}

#iygvvcniwa .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#iygvvcniwa .gt_font_normal {
  font-weight: normal;
}

#iygvvcniwa .gt_font_bold {
  font-weight: bold;
}

#iygvvcniwa .gt_font_italic {
  font-style: italic;
}

#iygvvcniwa .gt_super {
  font-size: 65%;
}

#iygvvcniwa .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="iygvvcniwa" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">open</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">high</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">low</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">close</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">volume</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">2010-06-15</td>
      <td class="gt_row gt_right">1091.21</td>
      <td class="gt_row gt_right">1115.59</td>
      <td class="gt_row gt_right">1091.21</td>
      <td class="gt_row gt_right">1115.23</td>
      <td class="gt_row gt_right">4644490000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-14</td>
      <td class="gt_row gt_right">1095.00</td>
      <td class="gt_row gt_right">1105.91</td>
      <td class="gt_row gt_right">1089.03</td>
      <td class="gt_row gt_right">1089.63</td>
      <td class="gt_row gt_right">4425830000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-11</td>
      <td class="gt_row gt_right">1082.65</td>
      <td class="gt_row gt_right">1092.25</td>
      <td class="gt_row gt_right">1077.12</td>
      <td class="gt_row gt_right">1091.60</td>
      <td class="gt_row gt_right">4059280000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-10</td>
      <td class="gt_row gt_right">1058.77</td>
      <td class="gt_row gt_right">1087.85</td>
      <td class="gt_row gt_right">1058.77</td>
      <td class="gt_row gt_right">1086.84</td>
      <td class="gt_row gt_right">5144780000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-09</td>
      <td class="gt_row gt_right">1062.75</td>
      <td class="gt_row gt_right">1077.74</td>
      <td class="gt_row gt_right">1052.25</td>
      <td class="gt_row gt_right">1055.69</td>
      <td class="gt_row gt_right">5983200000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-08</td>
      <td class="gt_row gt_right">1050.81</td>
      <td class="gt_row gt_right">1063.15</td>
      <td class="gt_row gt_right">1042.17</td>
      <td class="gt_row gt_right">1062.00</td>
      <td class="gt_row gt_right">6192750000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-07</td>
      <td class="gt_row gt_right">1065.84</td>
      <td class="gt_row gt_right">1071.36</td>
      <td class="gt_row gt_right">1049.86</td>
      <td class="gt_row gt_right">1050.47</td>
      <td class="gt_row gt_right">5467560000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-04</td>
      <td class="gt_row gt_right">1098.43</td>
      <td class="gt_row gt_right">1098.43</td>
      <td class="gt_row gt_right">1060.50</td>
      <td class="gt_row gt_right">1064.88</td>
      <td class="gt_row gt_right">6180580000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-03</td>
      <td class="gt_row gt_right">1098.82</td>
      <td class="gt_row gt_right">1105.67</td>
      <td class="gt_row gt_right">1091.81</td>
      <td class="gt_row gt_right">1102.83</td>
      <td class="gt_row gt_right">4995970000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-02</td>
      <td class="gt_row gt_right">1073.01</td>
      <td class="gt_row gt_right">1098.56</td>
      <td class="gt_row gt_right">1072.03</td>
      <td class="gt_row gt_right">1098.38</td>
      <td class="gt_row gt_right">5026360000</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->
]

---
count: false
 
# Taste of the gt package
.panel1-taste-gt-user[

```r
sp500_data %>%
  gt() %>%
* tab_header(
*   title = "S&P 500"
* )
```
]
 
.panel2-taste-gt-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#jlqojpshcw .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#jlqojpshcw .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#jlqojpshcw .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#jlqojpshcw .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#jlqojpshcw .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jlqojpshcw .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#jlqojpshcw .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#jlqojpshcw .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#jlqojpshcw .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#jlqojpshcw .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#jlqojpshcw .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#jlqojpshcw .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#jlqojpshcw .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#jlqojpshcw .gt_from_md > :first-child {
  margin-top: 0;
}

#jlqojpshcw .gt_from_md > :last-child {
  margin-bottom: 0;
}

#jlqojpshcw .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#jlqojpshcw .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#jlqojpshcw .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jlqojpshcw .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#jlqojpshcw .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jlqojpshcw .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#jlqojpshcw .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#jlqojpshcw .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jlqojpshcw .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#jlqojpshcw .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#jlqojpshcw .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#jlqojpshcw .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#jlqojpshcw .gt_left {
  text-align: left;
}

#jlqojpshcw .gt_center {
  text-align: center;
}

#jlqojpshcw .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#jlqojpshcw .gt_font_normal {
  font-weight: normal;
}

#jlqojpshcw .gt_font_bold {
  font-weight: bold;
}

#jlqojpshcw .gt_font_italic {
  font-style: italic;
}

#jlqojpshcw .gt_super {
  font-size: 65%;
}

#jlqojpshcw .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="jlqojpshcw" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>S&amp;P 500</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style></th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">open</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">high</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">low</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">close</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">volume</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">2010-06-15</td>
      <td class="gt_row gt_right">1091.21</td>
      <td class="gt_row gt_right">1115.59</td>
      <td class="gt_row gt_right">1091.21</td>
      <td class="gt_row gt_right">1115.23</td>
      <td class="gt_row gt_right">4644490000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-14</td>
      <td class="gt_row gt_right">1095.00</td>
      <td class="gt_row gt_right">1105.91</td>
      <td class="gt_row gt_right">1089.03</td>
      <td class="gt_row gt_right">1089.63</td>
      <td class="gt_row gt_right">4425830000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-11</td>
      <td class="gt_row gt_right">1082.65</td>
      <td class="gt_row gt_right">1092.25</td>
      <td class="gt_row gt_right">1077.12</td>
      <td class="gt_row gt_right">1091.60</td>
      <td class="gt_row gt_right">4059280000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-10</td>
      <td class="gt_row gt_right">1058.77</td>
      <td class="gt_row gt_right">1087.85</td>
      <td class="gt_row gt_right">1058.77</td>
      <td class="gt_row gt_right">1086.84</td>
      <td class="gt_row gt_right">5144780000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-09</td>
      <td class="gt_row gt_right">1062.75</td>
      <td class="gt_row gt_right">1077.74</td>
      <td class="gt_row gt_right">1052.25</td>
      <td class="gt_row gt_right">1055.69</td>
      <td class="gt_row gt_right">5983200000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-08</td>
      <td class="gt_row gt_right">1050.81</td>
      <td class="gt_row gt_right">1063.15</td>
      <td class="gt_row gt_right">1042.17</td>
      <td class="gt_row gt_right">1062.00</td>
      <td class="gt_row gt_right">6192750000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-07</td>
      <td class="gt_row gt_right">1065.84</td>
      <td class="gt_row gt_right">1071.36</td>
      <td class="gt_row gt_right">1049.86</td>
      <td class="gt_row gt_right">1050.47</td>
      <td class="gt_row gt_right">5467560000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-04</td>
      <td class="gt_row gt_right">1098.43</td>
      <td class="gt_row gt_right">1098.43</td>
      <td class="gt_row gt_right">1060.50</td>
      <td class="gt_row gt_right">1064.88</td>
      <td class="gt_row gt_right">6180580000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-03</td>
      <td class="gt_row gt_right">1098.82</td>
      <td class="gt_row gt_right">1105.67</td>
      <td class="gt_row gt_right">1091.81</td>
      <td class="gt_row gt_right">1102.83</td>
      <td class="gt_row gt_right">4995970000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2010-06-02</td>
      <td class="gt_row gt_right">1073.01</td>
      <td class="gt_row gt_right">1098.56</td>
      <td class="gt_row gt_right">1072.03</td>
      <td class="gt_row gt_right">1098.38</td>
      <td class="gt_row gt_right">5026360000</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->
]

---
count: false
 
# Taste of the gt package
.panel1-taste-gt-user[

```r
sp500_data %>%
  gt() %>%
  tab_header(
    title = "S&P 500"
  ) %>%
* fmt_date(
*   columns = vars(date),
*   date_style = 7
* )
```
]
 
.panel2-taste-gt-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#xfkyneqnlo .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#xfkyneqnlo .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#xfkyneqnlo .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#xfkyneqnlo .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#xfkyneqnlo .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#xfkyneqnlo .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#xfkyneqnlo .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#xfkyneqnlo .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#xfkyneqnlo .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#xfkyneqnlo .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#xfkyneqnlo .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#xfkyneqnlo .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#xfkyneqnlo .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#xfkyneqnlo .gt_from_md > :first-child {
  margin-top: 0;
}

#xfkyneqnlo .gt_from_md > :last-child {
  margin-bottom: 0;
}

#xfkyneqnlo .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#xfkyneqnlo .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#xfkyneqnlo .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#xfkyneqnlo .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#xfkyneqnlo .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#xfkyneqnlo .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#xfkyneqnlo .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#xfkyneqnlo .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#xfkyneqnlo .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#xfkyneqnlo .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#xfkyneqnlo .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#xfkyneqnlo .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#xfkyneqnlo .gt_left {
  text-align: left;
}

#xfkyneqnlo .gt_center {
  text-align: center;
}

#xfkyneqnlo .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#xfkyneqnlo .gt_font_normal {
  font-weight: normal;
}

#xfkyneqnlo .gt_font_bold {
  font-weight: bold;
}

#xfkyneqnlo .gt_font_italic {
  font-style: italic;
}

#xfkyneqnlo .gt_super {
  font-size: 65%;
}

#xfkyneqnlo .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="xfkyneqnlo" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>S&amp;P 500</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style></th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">open</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">high</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">low</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">close</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">volume</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">15 Jun 2010</td>
      <td class="gt_row gt_right">1091.21</td>
      <td class="gt_row gt_right">1115.59</td>
      <td class="gt_row gt_right">1091.21</td>
      <td class="gt_row gt_right">1115.23</td>
      <td class="gt_row gt_right">4644490000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">14 Jun 2010</td>
      <td class="gt_row gt_right">1095.00</td>
      <td class="gt_row gt_right">1105.91</td>
      <td class="gt_row gt_right">1089.03</td>
      <td class="gt_row gt_right">1089.63</td>
      <td class="gt_row gt_right">4425830000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">11 Jun 2010</td>
      <td class="gt_row gt_right">1082.65</td>
      <td class="gt_row gt_right">1092.25</td>
      <td class="gt_row gt_right">1077.12</td>
      <td class="gt_row gt_right">1091.60</td>
      <td class="gt_row gt_right">4059280000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">10 Jun 2010</td>
      <td class="gt_row gt_right">1058.77</td>
      <td class="gt_row gt_right">1087.85</td>
      <td class="gt_row gt_right">1058.77</td>
      <td class="gt_row gt_right">1086.84</td>
      <td class="gt_row gt_right">5144780000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">9 Jun 2010</td>
      <td class="gt_row gt_right">1062.75</td>
      <td class="gt_row gt_right">1077.74</td>
      <td class="gt_row gt_right">1052.25</td>
      <td class="gt_row gt_right">1055.69</td>
      <td class="gt_row gt_right">5983200000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">8 Jun 2010</td>
      <td class="gt_row gt_right">1050.81</td>
      <td class="gt_row gt_right">1063.15</td>
      <td class="gt_row gt_right">1042.17</td>
      <td class="gt_row gt_right">1062.00</td>
      <td class="gt_row gt_right">6192750000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">7 Jun 2010</td>
      <td class="gt_row gt_right">1065.84</td>
      <td class="gt_row gt_right">1071.36</td>
      <td class="gt_row gt_right">1049.86</td>
      <td class="gt_row gt_right">1050.47</td>
      <td class="gt_row gt_right">5467560000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">4 Jun 2010</td>
      <td class="gt_row gt_right">1098.43</td>
      <td class="gt_row gt_right">1098.43</td>
      <td class="gt_row gt_right">1060.50</td>
      <td class="gt_row gt_right">1064.88</td>
      <td class="gt_row gt_right">6180580000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">3 Jun 2010</td>
      <td class="gt_row gt_right">1098.82</td>
      <td class="gt_row gt_right">1105.67</td>
      <td class="gt_row gt_right">1091.81</td>
      <td class="gt_row gt_right">1102.83</td>
      <td class="gt_row gt_right">4995970000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2 Jun 2010</td>
      <td class="gt_row gt_right">1073.01</td>
      <td class="gt_row gt_right">1098.56</td>
      <td class="gt_row gt_right">1072.03</td>
      <td class="gt_row gt_right">1098.38</td>
      <td class="gt_row gt_right">5026360000</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->
]

---
count: false
 
# Taste of the gt package
.panel1-taste-gt-user[

```r
sp500_data %>%
  gt() %>%
  tab_header(
    title = "S&P 500"
  ) %>%
  fmt_date(
    columns = vars(date),
    date_style = 7
  ) %>%
* fmt_currency(
*   columns = vars(open, high, low, close),
*   currency = "USD"
* )
```
]
 
.panel2-taste-gt-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#fhqaamvdet .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#fhqaamvdet .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#fhqaamvdet .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#fhqaamvdet .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#fhqaamvdet .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fhqaamvdet .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#fhqaamvdet .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#fhqaamvdet .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#fhqaamvdet .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#fhqaamvdet .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#fhqaamvdet .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#fhqaamvdet .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#fhqaamvdet .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#fhqaamvdet .gt_from_md > :first-child {
  margin-top: 0;
}

#fhqaamvdet .gt_from_md > :last-child {
  margin-bottom: 0;
}

#fhqaamvdet .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#fhqaamvdet .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#fhqaamvdet .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#fhqaamvdet .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#fhqaamvdet .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#fhqaamvdet .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#fhqaamvdet .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#fhqaamvdet .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fhqaamvdet .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#fhqaamvdet .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#fhqaamvdet .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#fhqaamvdet .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#fhqaamvdet .gt_left {
  text-align: left;
}

#fhqaamvdet .gt_center {
  text-align: center;
}

#fhqaamvdet .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#fhqaamvdet .gt_font_normal {
  font-weight: normal;
}

#fhqaamvdet .gt_font_bold {
  font-weight: bold;
}

#fhqaamvdet .gt_font_italic {
  font-style: italic;
}

#fhqaamvdet .gt_super {
  font-size: 65%;
}

#fhqaamvdet .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="fhqaamvdet" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>S&amp;P 500</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style></th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">open</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">high</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">low</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">close</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">volume</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">15 Jun 2010</td>
      <td class="gt_row gt_right">$1,091.21</td>
      <td class="gt_row gt_right">$1,115.59</td>
      <td class="gt_row gt_right">$1,091.21</td>
      <td class="gt_row gt_right">$1,115.23</td>
      <td class="gt_row gt_right">4644490000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">14 Jun 2010</td>
      <td class="gt_row gt_right">$1,095.00</td>
      <td class="gt_row gt_right">$1,105.91</td>
      <td class="gt_row gt_right">$1,089.03</td>
      <td class="gt_row gt_right">$1,089.63</td>
      <td class="gt_row gt_right">4425830000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">11 Jun 2010</td>
      <td class="gt_row gt_right">$1,082.65</td>
      <td class="gt_row gt_right">$1,092.25</td>
      <td class="gt_row gt_right">$1,077.12</td>
      <td class="gt_row gt_right">$1,091.60</td>
      <td class="gt_row gt_right">4059280000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">10 Jun 2010</td>
      <td class="gt_row gt_right">$1,058.77</td>
      <td class="gt_row gt_right">$1,087.85</td>
      <td class="gt_row gt_right">$1,058.77</td>
      <td class="gt_row gt_right">$1,086.84</td>
      <td class="gt_row gt_right">5144780000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">9 Jun 2010</td>
      <td class="gt_row gt_right">$1,062.75</td>
      <td class="gt_row gt_right">$1,077.74</td>
      <td class="gt_row gt_right">$1,052.25</td>
      <td class="gt_row gt_right">$1,055.69</td>
      <td class="gt_row gt_right">5983200000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">8 Jun 2010</td>
      <td class="gt_row gt_right">$1,050.81</td>
      <td class="gt_row gt_right">$1,063.15</td>
      <td class="gt_row gt_right">$1,042.17</td>
      <td class="gt_row gt_right">$1,062.00</td>
      <td class="gt_row gt_right">6192750000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">7 Jun 2010</td>
      <td class="gt_row gt_right">$1,065.84</td>
      <td class="gt_row gt_right">$1,071.36</td>
      <td class="gt_row gt_right">$1,049.86</td>
      <td class="gt_row gt_right">$1,050.47</td>
      <td class="gt_row gt_right">5467560000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">4 Jun 2010</td>
      <td class="gt_row gt_right">$1,098.43</td>
      <td class="gt_row gt_right">$1,098.43</td>
      <td class="gt_row gt_right">$1,060.50</td>
      <td class="gt_row gt_right">$1,064.88</td>
      <td class="gt_row gt_right">6180580000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">3 Jun 2010</td>
      <td class="gt_row gt_right">$1,098.82</td>
      <td class="gt_row gt_right">$1,105.67</td>
      <td class="gt_row gt_right">$1,091.81</td>
      <td class="gt_row gt_right">$1,102.83</td>
      <td class="gt_row gt_right">4995970000</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2 Jun 2010</td>
      <td class="gt_row gt_right">$1,073.01</td>
      <td class="gt_row gt_right">$1,098.56</td>
      <td class="gt_row gt_right">$1,072.03</td>
      <td class="gt_row gt_right">$1,098.38</td>
      <td class="gt_row gt_right">5026360000</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->
]

---
count: false
 
# Taste of the gt package
.panel1-taste-gt-user[

```r
sp500_data %>%
  gt() %>%
  tab_header(
    title = "S&P 500"
  ) %>%
  fmt_date(
    columns = vars(date),
    date_style = 7
  ) %>%
  fmt_currency(
    columns = vars(open, high, low, close),
    currency = "USD"
  ) %>%
* fmt_number(
*   columns = vars(volume),
*   scale_by = 1 / 1E9,
*   pattern = "{x}B"
* )
```
]
 
.panel2-taste-gt-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#lqfpfpfpkr .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#lqfpfpfpkr .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#lqfpfpfpkr .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#lqfpfpfpkr .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#lqfpfpfpkr .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#lqfpfpfpkr .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#lqfpfpfpkr .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#lqfpfpfpkr .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#lqfpfpfpkr .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#lqfpfpfpkr .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#lqfpfpfpkr .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#lqfpfpfpkr .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#lqfpfpfpkr .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#lqfpfpfpkr .gt_from_md > :first-child {
  margin-top: 0;
}

#lqfpfpfpkr .gt_from_md > :last-child {
  margin-bottom: 0;
}

#lqfpfpfpkr .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#lqfpfpfpkr .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#lqfpfpfpkr .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#lqfpfpfpkr .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#lqfpfpfpkr .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#lqfpfpfpkr .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#lqfpfpfpkr .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#lqfpfpfpkr .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#lqfpfpfpkr .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#lqfpfpfpkr .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#lqfpfpfpkr .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#lqfpfpfpkr .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#lqfpfpfpkr .gt_left {
  text-align: left;
}

#lqfpfpfpkr .gt_center {
  text-align: center;
}

#lqfpfpfpkr .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#lqfpfpfpkr .gt_font_normal {
  font-weight: normal;
}

#lqfpfpfpkr .gt_font_bold {
  font-weight: bold;
}

#lqfpfpfpkr .gt_font_italic {
  font-style: italic;
}

#lqfpfpfpkr .gt_super {
  font-size: 65%;
}

#lqfpfpfpkr .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="lqfpfpfpkr" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>S&amp;P 500</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style></th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">open</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">high</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">low</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">close</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">volume</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">15 Jun 2010</td>
      <td class="gt_row gt_right">$1,091.21</td>
      <td class="gt_row gt_right">$1,115.59</td>
      <td class="gt_row gt_right">$1,091.21</td>
      <td class="gt_row gt_right">$1,115.23</td>
      <td class="gt_row gt_right">4.64B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">14 Jun 2010</td>
      <td class="gt_row gt_right">$1,095.00</td>
      <td class="gt_row gt_right">$1,105.91</td>
      <td class="gt_row gt_right">$1,089.03</td>
      <td class="gt_row gt_right">$1,089.63</td>
      <td class="gt_row gt_right">4.43B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">11 Jun 2010</td>
      <td class="gt_row gt_right">$1,082.65</td>
      <td class="gt_row gt_right">$1,092.25</td>
      <td class="gt_row gt_right">$1,077.12</td>
      <td class="gt_row gt_right">$1,091.60</td>
      <td class="gt_row gt_right">4.06B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">10 Jun 2010</td>
      <td class="gt_row gt_right">$1,058.77</td>
      <td class="gt_row gt_right">$1,087.85</td>
      <td class="gt_row gt_right">$1,058.77</td>
      <td class="gt_row gt_right">$1,086.84</td>
      <td class="gt_row gt_right">5.14B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">9 Jun 2010</td>
      <td class="gt_row gt_right">$1,062.75</td>
      <td class="gt_row gt_right">$1,077.74</td>
      <td class="gt_row gt_right">$1,052.25</td>
      <td class="gt_row gt_right">$1,055.69</td>
      <td class="gt_row gt_right">5.98B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">8 Jun 2010</td>
      <td class="gt_row gt_right">$1,050.81</td>
      <td class="gt_row gt_right">$1,063.15</td>
      <td class="gt_row gt_right">$1,042.17</td>
      <td class="gt_row gt_right">$1,062.00</td>
      <td class="gt_row gt_right">6.19B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">7 Jun 2010</td>
      <td class="gt_row gt_right">$1,065.84</td>
      <td class="gt_row gt_right">$1,071.36</td>
      <td class="gt_row gt_right">$1,049.86</td>
      <td class="gt_row gt_right">$1,050.47</td>
      <td class="gt_row gt_right">5.47B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">4 Jun 2010</td>
      <td class="gt_row gt_right">$1,098.43</td>
      <td class="gt_row gt_right">$1,098.43</td>
      <td class="gt_row gt_right">$1,060.50</td>
      <td class="gt_row gt_right">$1,064.88</td>
      <td class="gt_row gt_right">6.18B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">3 Jun 2010</td>
      <td class="gt_row gt_right">$1,098.82</td>
      <td class="gt_row gt_right">$1,105.67</td>
      <td class="gt_row gt_right">$1,091.81</td>
      <td class="gt_row gt_right">$1,102.83</td>
      <td class="gt_row gt_right">5.00B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2 Jun 2010</td>
      <td class="gt_row gt_right">$1,073.01</td>
      <td class="gt_row gt_right">$1,098.56</td>
      <td class="gt_row gt_right">$1,072.03</td>
      <td class="gt_row gt_right">$1,098.38</td>
      <td class="gt_row gt_right">5.03B</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->
]

---
count: false
 
# Taste of the gt package
.panel1-taste-gt-user[

```r
sp500_data %>%
  gt() %>%
  tab_header(
    title = "S&P 500"
  ) %>%
  fmt_date(
    columns = vars(date),
    date_style = 7
  ) %>%
  fmt_currency(
    columns = vars(open, high, low, close),
    currency = "USD"
  ) %>%
  fmt_number(
    columns = vars(volume),
    scale_by = 1 / 1E9,
    pattern = "{x}B"
  ) %>%
* text_transform(
*   locations = cells_body(
*     columns = "close",
*     rows = close > open),
*   fn = function(x) paste(x, up_arrow)
* )
```
]
 
.panel2-taste-gt-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#gefzrygnvv .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#gefzrygnvv .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#gefzrygnvv .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#gefzrygnvv .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#gefzrygnvv .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#gefzrygnvv .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#gefzrygnvv .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#gefzrygnvv .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#gefzrygnvv .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#gefzrygnvv .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#gefzrygnvv .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#gefzrygnvv .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#gefzrygnvv .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#gefzrygnvv .gt_from_md > :first-child {
  margin-top: 0;
}

#gefzrygnvv .gt_from_md > :last-child {
  margin-bottom: 0;
}

#gefzrygnvv .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#gefzrygnvv .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#gefzrygnvv .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#gefzrygnvv .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#gefzrygnvv .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#gefzrygnvv .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#gefzrygnvv .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#gefzrygnvv .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#gefzrygnvv .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#gefzrygnvv .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#gefzrygnvv .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#gefzrygnvv .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#gefzrygnvv .gt_left {
  text-align: left;
}

#gefzrygnvv .gt_center {
  text-align: center;
}

#gefzrygnvv .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#gefzrygnvv .gt_font_normal {
  font-weight: normal;
}

#gefzrygnvv .gt_font_bold {
  font-weight: bold;
}

#gefzrygnvv .gt_font_italic {
  font-style: italic;
}

#gefzrygnvv .gt_super {
  font-size: 65%;
}

#gefzrygnvv .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="gefzrygnvv" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>S&amp;P 500</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style></th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">open</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">high</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">low</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">close</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">volume</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">15 Jun 2010</td>
      <td class="gt_row gt_right">$1,091.21</td>
      <td class="gt_row gt_right">$1,115.59</td>
      <td class="gt_row gt_right">$1,091.21</td>
      <td class="gt_row gt_right">$1,115.23 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">4.64B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">14 Jun 2010</td>
      <td class="gt_row gt_right">$1,095.00</td>
      <td class="gt_row gt_right">$1,105.91</td>
      <td class="gt_row gt_right">$1,089.03</td>
      <td class="gt_row gt_right">$1,089.63</td>
      <td class="gt_row gt_right">4.43B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">11 Jun 2010</td>
      <td class="gt_row gt_right">$1,082.65</td>
      <td class="gt_row gt_right">$1,092.25</td>
      <td class="gt_row gt_right">$1,077.12</td>
      <td class="gt_row gt_right">$1,091.60 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">4.06B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">10 Jun 2010</td>
      <td class="gt_row gt_right">$1,058.77</td>
      <td class="gt_row gt_right">$1,087.85</td>
      <td class="gt_row gt_right">$1,058.77</td>
      <td class="gt_row gt_right">$1,086.84 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">5.14B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">9 Jun 2010</td>
      <td class="gt_row gt_right">$1,062.75</td>
      <td class="gt_row gt_right">$1,077.74</td>
      <td class="gt_row gt_right">$1,052.25</td>
      <td class="gt_row gt_right">$1,055.69</td>
      <td class="gt_row gt_right">5.98B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">8 Jun 2010</td>
      <td class="gt_row gt_right">$1,050.81</td>
      <td class="gt_row gt_right">$1,063.15</td>
      <td class="gt_row gt_right">$1,042.17</td>
      <td class="gt_row gt_right">$1,062.00 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">6.19B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">7 Jun 2010</td>
      <td class="gt_row gt_right">$1,065.84</td>
      <td class="gt_row gt_right">$1,071.36</td>
      <td class="gt_row gt_right">$1,049.86</td>
      <td class="gt_row gt_right">$1,050.47</td>
      <td class="gt_row gt_right">5.47B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">4 Jun 2010</td>
      <td class="gt_row gt_right">$1,098.43</td>
      <td class="gt_row gt_right">$1,098.43</td>
      <td class="gt_row gt_right">$1,060.50</td>
      <td class="gt_row gt_right">$1,064.88</td>
      <td class="gt_row gt_right">6.18B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">3 Jun 2010</td>
      <td class="gt_row gt_right">$1,098.82</td>
      <td class="gt_row gt_right">$1,105.67</td>
      <td class="gt_row gt_right">$1,091.81</td>
      <td class="gt_row gt_right">$1,102.83 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">5.00B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2 Jun 2010</td>
      <td class="gt_row gt_right">$1,073.01</td>
      <td class="gt_row gt_right">$1,098.56</td>
      <td class="gt_row gt_right">$1,072.03</td>
      <td class="gt_row gt_right">$1,098.38 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">5.03B</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->
]

---
count: false
 
# Taste of the gt package
.panel1-taste-gt-user[

```r
sp500_data %>%
  gt() %>%
  tab_header(
    title = "S&P 500"
  ) %>%
  fmt_date(
    columns = vars(date),
    date_style = 7
  ) %>%
  fmt_currency(
    columns = vars(open, high, low, close),
    currency = "USD"
  ) %>%
  fmt_number(
    columns = vars(volume),
    scale_by = 1 / 1E9,
    pattern = "{x}B"
  ) %>%
  text_transform(
    locations = cells_body(
      columns = "close",
      rows = close > open),
    fn = function(x) paste(x, up_arrow)
  ) %>%
* text_transform(
*   locations = cells_body(
*     columns = "close",
*     rows = close < open),
*   fn = function(x) paste(x, down_arrow)
* )
```
]
 
.panel2-taste-gt-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#mzgdqwvwah .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#mzgdqwvwah .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#mzgdqwvwah .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#mzgdqwvwah .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#mzgdqwvwah .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#mzgdqwvwah .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#mzgdqwvwah .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#mzgdqwvwah .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#mzgdqwvwah .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#mzgdqwvwah .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#mzgdqwvwah .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#mzgdqwvwah .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#mzgdqwvwah .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#mzgdqwvwah .gt_from_md > :first-child {
  margin-top: 0;
}

#mzgdqwvwah .gt_from_md > :last-child {
  margin-bottom: 0;
}

#mzgdqwvwah .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#mzgdqwvwah .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#mzgdqwvwah .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#mzgdqwvwah .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#mzgdqwvwah .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#mzgdqwvwah .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#mzgdqwvwah .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#mzgdqwvwah .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#mzgdqwvwah .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#mzgdqwvwah .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#mzgdqwvwah .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#mzgdqwvwah .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#mzgdqwvwah .gt_left {
  text-align: left;
}

#mzgdqwvwah .gt_center {
  text-align: center;
}

#mzgdqwvwah .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#mzgdqwvwah .gt_font_normal {
  font-weight: normal;
}

#mzgdqwvwah .gt_font_bold {
  font-weight: bold;
}

#mzgdqwvwah .gt_font_italic {
  font-style: italic;
}

#mzgdqwvwah .gt_super {
  font-size: 65%;
}

#mzgdqwvwah .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="mzgdqwvwah" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>S&amp;P 500</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style></th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">open</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">high</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">low</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">close</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">volume</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">15 Jun 2010</td>
      <td class="gt_row gt_right">$1,091.21</td>
      <td class="gt_row gt_right">$1,115.59</td>
      <td class="gt_row gt_right">$1,091.21</td>
      <td class="gt_row gt_right">$1,115.23 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">4.64B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">14 Jun 2010</td>
      <td class="gt_row gt_right">$1,095.00</td>
      <td class="gt_row gt_right">$1,105.91</td>
      <td class="gt_row gt_right">$1,089.03</td>
      <td class="gt_row gt_right">$1,089.63 <span style="color:red">&#9660;</span></td>
      <td class="gt_row gt_right">4.43B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">11 Jun 2010</td>
      <td class="gt_row gt_right">$1,082.65</td>
      <td class="gt_row gt_right">$1,092.25</td>
      <td class="gt_row gt_right">$1,077.12</td>
      <td class="gt_row gt_right">$1,091.60 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">4.06B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">10 Jun 2010</td>
      <td class="gt_row gt_right">$1,058.77</td>
      <td class="gt_row gt_right">$1,087.85</td>
      <td class="gt_row gt_right">$1,058.77</td>
      <td class="gt_row gt_right">$1,086.84 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">5.14B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">9 Jun 2010</td>
      <td class="gt_row gt_right">$1,062.75</td>
      <td class="gt_row gt_right">$1,077.74</td>
      <td class="gt_row gt_right">$1,052.25</td>
      <td class="gt_row gt_right">$1,055.69 <span style="color:red">&#9660;</span></td>
      <td class="gt_row gt_right">5.98B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">8 Jun 2010</td>
      <td class="gt_row gt_right">$1,050.81</td>
      <td class="gt_row gt_right">$1,063.15</td>
      <td class="gt_row gt_right">$1,042.17</td>
      <td class="gt_row gt_right">$1,062.00 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">6.19B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">7 Jun 2010</td>
      <td class="gt_row gt_right">$1,065.84</td>
      <td class="gt_row gt_right">$1,071.36</td>
      <td class="gt_row gt_right">$1,049.86</td>
      <td class="gt_row gt_right">$1,050.47 <span style="color:red">&#9660;</span></td>
      <td class="gt_row gt_right">5.47B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">4 Jun 2010</td>
      <td class="gt_row gt_right">$1,098.43</td>
      <td class="gt_row gt_right">$1,098.43</td>
      <td class="gt_row gt_right">$1,060.50</td>
      <td class="gt_row gt_right">$1,064.88 <span style="color:red">&#9660;</span></td>
      <td class="gt_row gt_right">6.18B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">3 Jun 2010</td>
      <td class="gt_row gt_right">$1,098.82</td>
      <td class="gt_row gt_right">$1,105.67</td>
      <td class="gt_row gt_right">$1,091.81</td>
      <td class="gt_row gt_right">$1,102.83 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">5.00B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2 Jun 2010</td>
      <td class="gt_row gt_right">$1,073.01</td>
      <td class="gt_row gt_right">$1,098.56</td>
      <td class="gt_row gt_right">$1,072.03</td>
      <td class="gt_row gt_right">$1,098.38 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">5.03B</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->
]

---
count: false
 
# Taste of the gt package
.panel1-taste-gt-user[

```r
sp500_data %>%
  gt() %>%
  tab_header(
    title = "S&P 500"
  ) %>%
  fmt_date(
    columns = vars(date),
    date_style = 7
  ) %>%
  fmt_currency(
    columns = vars(open, high, low, close),
    currency = "USD"
  ) %>%
  fmt_number(
    columns = vars(volume),
    scale_by = 1 / 1E9,
    pattern = "{x}B"
  ) %>%
  text_transform(
    locations = cells_body(
      columns = "close",
      rows = close > open),
    fn = function(x) paste(x, up_arrow)
  ) %>%
  text_transform(
    locations = cells_body(
      columns = "close",
      rows = close < open),
    fn = function(x) paste(x, down_arrow)
  ) %>%
* cols_label(
*   date = "Date", open = "Open",
*   high = "High", low = "Low",
*   close = "Close", volume = "Volume"
* )
```
]
 
.panel2-taste-gt-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#cqysvsucdt .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#cqysvsucdt .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#cqysvsucdt .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#cqysvsucdt .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#cqysvsucdt .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cqysvsucdt .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#cqysvsucdt .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#cqysvsucdt .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#cqysvsucdt .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#cqysvsucdt .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#cqysvsucdt .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#cqysvsucdt .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#cqysvsucdt .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#cqysvsucdt .gt_from_md > :first-child {
  margin-top: 0;
}

#cqysvsucdt .gt_from_md > :last-child {
  margin-bottom: 0;
}

#cqysvsucdt .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#cqysvsucdt .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#cqysvsucdt .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cqysvsucdt .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#cqysvsucdt .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cqysvsucdt .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#cqysvsucdt .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#cqysvsucdt .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cqysvsucdt .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#cqysvsucdt .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#cqysvsucdt .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#cqysvsucdt .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#cqysvsucdt .gt_left {
  text-align: left;
}

#cqysvsucdt .gt_center {
  text-align: center;
}

#cqysvsucdt .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#cqysvsucdt .gt_font_normal {
  font-weight: normal;
}

#cqysvsucdt .gt_font_bold {
  font-weight: bold;
}

#cqysvsucdt .gt_font_italic {
  font-style: italic;
}

#cqysvsucdt .gt_super {
  font-size: 65%;
}

#cqysvsucdt .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="cqysvsucdt" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>S&amp;P 500</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style></th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">Date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Open</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">High</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Low</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Close</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">Volume</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">15 Jun 2010</td>
      <td class="gt_row gt_right">$1,091.21</td>
      <td class="gt_row gt_right">$1,115.59</td>
      <td class="gt_row gt_right">$1,091.21</td>
      <td class="gt_row gt_right">$1,115.23 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">4.64B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">14 Jun 2010</td>
      <td class="gt_row gt_right">$1,095.00</td>
      <td class="gt_row gt_right">$1,105.91</td>
      <td class="gt_row gt_right">$1,089.03</td>
      <td class="gt_row gt_right">$1,089.63 <span style="color:red">&#9660;</span></td>
      <td class="gt_row gt_right">4.43B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">11 Jun 2010</td>
      <td class="gt_row gt_right">$1,082.65</td>
      <td class="gt_row gt_right">$1,092.25</td>
      <td class="gt_row gt_right">$1,077.12</td>
      <td class="gt_row gt_right">$1,091.60 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">4.06B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">10 Jun 2010</td>
      <td class="gt_row gt_right">$1,058.77</td>
      <td class="gt_row gt_right">$1,087.85</td>
      <td class="gt_row gt_right">$1,058.77</td>
      <td class="gt_row gt_right">$1,086.84 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">5.14B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">9 Jun 2010</td>
      <td class="gt_row gt_right">$1,062.75</td>
      <td class="gt_row gt_right">$1,077.74</td>
      <td class="gt_row gt_right">$1,052.25</td>
      <td class="gt_row gt_right">$1,055.69 <span style="color:red">&#9660;</span></td>
      <td class="gt_row gt_right">5.98B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">8 Jun 2010</td>
      <td class="gt_row gt_right">$1,050.81</td>
      <td class="gt_row gt_right">$1,063.15</td>
      <td class="gt_row gt_right">$1,042.17</td>
      <td class="gt_row gt_right">$1,062.00 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">6.19B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">7 Jun 2010</td>
      <td class="gt_row gt_right">$1,065.84</td>
      <td class="gt_row gt_right">$1,071.36</td>
      <td class="gt_row gt_right">$1,049.86</td>
      <td class="gt_row gt_right">$1,050.47 <span style="color:red">&#9660;</span></td>
      <td class="gt_row gt_right">5.47B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">4 Jun 2010</td>
      <td class="gt_row gt_right">$1,098.43</td>
      <td class="gt_row gt_right">$1,098.43</td>
      <td class="gt_row gt_right">$1,060.50</td>
      <td class="gt_row gt_right">$1,064.88 <span style="color:red">&#9660;</span></td>
      <td class="gt_row gt_right">6.18B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">3 Jun 2010</td>
      <td class="gt_row gt_right">$1,098.82</td>
      <td class="gt_row gt_right">$1,105.67</td>
      <td class="gt_row gt_right">$1,091.81</td>
      <td class="gt_row gt_right">$1,102.83 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">5.00B</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">2 Jun 2010</td>
      <td class="gt_row gt_right">$1,073.01</td>
      <td class="gt_row gt_right">$1,098.56</td>
      <td class="gt_row gt_right">$1,072.03</td>
      <td class="gt_row gt_right">$1,098.38 <span style="color:green">&#9650;</span></td>
      <td class="gt_row gt_right">5.03B</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->
]

<style>
.panel1-taste-gt-user {
  color: black;
  width: 49%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel2-taste-gt-user {
  color: black;
  width: 49%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel3-taste-gt-user {
  color: black;
  width: NA%;
  hight: 33%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
</style>


  
<!-- 
#=========================================
# Create or Modify Parts  
#=========================================
-->
  
---

class: inverse, center, middle
name: dif-geoms

# Create table and modify Parts  

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=1000px></html>

---


# Initiate a table 

.panelset[ 

.panel[.panel-name[Data Preparation]

.left4[

```r
#--- Define regions ---#
Australasia <- c("AU", "NZ")
Melanesia <- c("NC", "PG", "SB", "VU")
Polynesia <- c("PF", "WS", "TO", "TV")

#--- create a dataset ---#
tab_data <- countrypops %>%
  filter(country_code_2 %in% c(
    Australasia, Melanesia, Polynesia)
  ) %>%
  filter(year %in% c(1995, 2005, 2015)) %>%
  mutate(region = case_when(
    country_code_2 %in% Australasia ~ "Australasia",
    country_code_2 %in% Melanesia ~ "Melanesia",
    country_code_2 %in% Polynesia ~ "Polynesia",
  )) %>%
  pivot_wider(
    values_from = population, 
    names_from = year,
    names_prefix = "y_"
  ) %>%
  arrange(region, desc(y_2015)) %>%
  select(-starts_with("country_code")) %>% 
  mutate(
    pop_ratio_10_15 = y_2015/y_2005,
    date = "2013-11-14"
  )  
```
]

.right6[

```
## # A tibble: 10 x 7
##    country_name region y_1995 y_2005 y_2015
##    <chr>        <chr>   <int>  <int>  <int>
##  1 Australia    Austr… 1.81e7 2.04e7 2.39e7
##  2 New Zealand  Austr… 3.67e6 4.13e6 4.60e6
##  3 Papua New G… Melan… 4.89e6 6.31e6 7.92e6
##  4 Solomon Isl… Melan… 3.59e5 4.70e5 5.87e5
##  5 New Caledon… Melan… 1.94e5 2.32e5 2.72e5
##  6 Vanuatu      Melan… 1.68e5 2.09e5 2.65e5
##  7 French Poly… Polyn… 2.15e5 2.55e5 2.78e5
##  8 Samoa        Polyn… 1.70e5 1.80e5 1.94e5
##  9 Tonga        Polyn… 9.61e4 1.01e5 1.06e5
## 10 Tuvalu       Polyn… 9.23e3 1.00e4 1.10e4
## # … with 2 more variables: pop_ratio_10_15 <dbl>,
## #   date <chr>
```
]

  ] 

  <!-- panel ends here -->
.panel[.panel-name[Instruction]

You can apply the `gt()` function to a `data.frame()` (or `tibble`) to create a basic table:

.left-code[

```r
gt(tab_data)
```
]

.right-plot[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#poahczfngl .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#poahczfngl .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#poahczfngl .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#poahczfngl .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#poahczfngl .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#poahczfngl .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#poahczfngl .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#poahczfngl .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#poahczfngl .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#poahczfngl .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#poahczfngl .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#poahczfngl .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#poahczfngl .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#poahczfngl .gt_from_md > :first-child {
  margin-top: 0;
}

#poahczfngl .gt_from_md > :last-child {
  margin-bottom: 0;
}

#poahczfngl .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#poahczfngl .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#poahczfngl .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#poahczfngl .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#poahczfngl .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#poahczfngl .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#poahczfngl .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#poahczfngl .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#poahczfngl .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#poahczfngl .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#poahczfngl .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#poahczfngl .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#poahczfngl .gt_left {
  text-align: left;
}

#poahczfngl .gt_center {
  text-align: center;
}

#poahczfngl .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#poahczfngl .gt_font_normal {
  font-weight: normal;
}

#poahczfngl .gt_font_bold {
  font-weight: bold;
}

#poahczfngl .gt_font_italic {
  font-style: italic;
}

#poahczfngl .gt_super {
  font-size: 65%;
}

#poahczfngl .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="poahczfngl" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">country_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">region</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_1995</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">date</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">Australia</td>
      <td class="gt_row gt_left">Australasia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Zealand</td>
      <td class="gt_row gt_left">Australasia</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Papua New Guinea</td>
      <td class="gt_row gt_left">Melanesia</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Solomon Islands</td>
      <td class="gt_row gt_left">Melanesia</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Caledonia</td>
      <td class="gt_row gt_left">Melanesia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Vanuatu</td>
      <td class="gt_row gt_left">Melanesia</td>
      <td class="gt_row gt_center">168235</td>
      <td class="gt_row gt_center">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">French Polynesia</td>
      <td class="gt_row gt_left">Polynesia</td>
      <td class="gt_row gt_center">215196</td>
      <td class="gt_row gt_center">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Samoa</td>
      <td class="gt_row gt_left">Polynesia</td>
      <td class="gt_row gt_center">170157</td>
      <td class="gt_row gt_center">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Tonga</td>
      <td class="gt_row gt_left">Polynesia</td>
      <td class="gt_row gt_center">96076</td>
      <td class="gt_row gt_center">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Tuvalu</td>
      <td class="gt_row gt_left">Polynesia</td>
      <td class="gt_row gt_center">9230</td>
      <td class="gt_row gt_center">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->
]

  ]
  <!-- panel ends here -->

.panel[.panel-name[Options]

.left-full[

Several useful options you might want to use when initiating a table with `gt()` are:

+ `rowname_col =`: specify which variable of the dataset becomes the row names 
+ `groupname_col =`: specify which variable of the dataset defines the groups each of the rows belong to  

We will see how they are used later in a demonstration.

]

  ] 

  <!-- panel ends here -->
]

<!-- panel set ends here -->


---

# Create or Modify Parts 

.panelset[ 


.panel[.panel-name[Modify parts]

.left-full[

From the most basic table you can generate by applying `gt()` function to create a table, you can add parts and modify the style using various functions:

+ `tab_header()`: add a table header
+ `tab_spanner()`: add a spanner column label
+ `tab_spanner_delim()`: create column labels and spanners via delimited names
+ `tab_row_group()`: add a row group to a `gt` table
+ `tab_stubhead()`: add label text to the stubhead
+ .orange[`tab_footnote()`]: add a table footnote
+ `tab_source_note()`: add a source note citation
+ `tab_style()`: add custom styles to one or more cells
+ `tab_options()`: modify the table output options

<br>

.red[Note]: Inside these functions, you specify the details of the **actions** and **locations** where you take actions (unless the locations of the actions are fixed like `tab_header()`).


]

  ]

<!-- panel ends here -->

.panel[.panel-name[Ex 1]

This adds the title and subtitle to the table at the top of the table (thus no need to specify the location.)


```r
tab_header(
  #--- actions ---#
  title = "A", 
  subtitle = "B"
)
```

.left5[

Before:

<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#poahczfngl .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#poahczfngl .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#poahczfngl .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#poahczfngl .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#poahczfngl .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#poahczfngl .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#poahczfngl .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#poahczfngl .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#poahczfngl .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#poahczfngl .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#poahczfngl .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#poahczfngl .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#poahczfngl .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#poahczfngl .gt_from_md > :first-child {
  margin-top: 0;
}

#poahczfngl .gt_from_md > :last-child {
  margin-bottom: 0;
}

#poahczfngl .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#poahczfngl .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#poahczfngl .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#poahczfngl .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#poahczfngl .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#poahczfngl .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#poahczfngl .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#poahczfngl .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#poahczfngl .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#poahczfngl .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#poahczfngl .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#poahczfngl .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#poahczfngl .gt_left {
  text-align: left;
}

#poahczfngl .gt_center {
  text-align: center;
}

#poahczfngl .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#poahczfngl .gt_font_normal {
  font-weight: normal;
}

#poahczfngl .gt_font_bold {
  font-weight: bold;
}

#poahczfngl .gt_font_italic {
  font-style: italic;
}

#poahczfngl .gt_super {
  font-size: 65%;
}

#poahczfngl .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="poahczfngl" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">country_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_1995</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->

]

.right5[

After:

<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#kbwojinlfb .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#kbwojinlfb .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kbwojinlfb .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#kbwojinlfb .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#kbwojinlfb .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kbwojinlfb .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kbwojinlfb .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#kbwojinlfb .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#kbwojinlfb .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#kbwojinlfb .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#kbwojinlfb .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#kbwojinlfb .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#kbwojinlfb .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#kbwojinlfb .gt_from_md > :first-child {
  margin-top: 0;
}

#kbwojinlfb .gt_from_md > :last-child {
  margin-bottom: 0;
}

#kbwojinlfb .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#kbwojinlfb .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#kbwojinlfb .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kbwojinlfb .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#kbwojinlfb .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kbwojinlfb .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#kbwojinlfb .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#kbwojinlfb .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kbwojinlfb .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kbwojinlfb .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#kbwojinlfb .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kbwojinlfb .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#kbwojinlfb .gt_left {
  text-align: left;
}

#kbwojinlfb .gt_center {
  text-align: center;
}

#kbwojinlfb .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#kbwojinlfb .gt_font_normal {
  font-weight: normal;
}

#kbwojinlfb .gt_font_bold {
  font-weight: bold;
}

#kbwojinlfb .gt_font_italic {
  font-style: italic;
}

#kbwojinlfb .gt_super {
  font-size: 65%;
}

#kbwojinlfb .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="kbwojinlfb" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="4" class="gt_heading gt_title gt_font_normal" style>A</th>
    </tr>
    <tr>
      <th colspan="4" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>B</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">country_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_1995</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->

]

  ] 

<!-- panel ends here -->

.panel[.panel-name[Ex 2]

This adds a footnote label to the right of the `y_2015` column label and put the footnote text `"This is a footnote"` at the bottom of the table.


```r
tab_footnote(
  #--- action ---#
  footnote = "This is a footnote", 
  #--- location ---#
  locations = cells_column_labels(columns = vars(y_2015))
  )
```

.left5[

Before:

<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#zswrxcyrxn .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#zswrxcyrxn .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zswrxcyrxn .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#zswrxcyrxn .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#zswrxcyrxn .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zswrxcyrxn .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zswrxcyrxn .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#zswrxcyrxn .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#zswrxcyrxn .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#zswrxcyrxn .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#zswrxcyrxn .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#zswrxcyrxn .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#zswrxcyrxn .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#zswrxcyrxn .gt_from_md > :first-child {
  margin-top: 0;
}

#zswrxcyrxn .gt_from_md > :last-child {
  margin-bottom: 0;
}

#zswrxcyrxn .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#zswrxcyrxn .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#zswrxcyrxn .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zswrxcyrxn .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#zswrxcyrxn .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zswrxcyrxn .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#zswrxcyrxn .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#zswrxcyrxn .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zswrxcyrxn .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zswrxcyrxn .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#zswrxcyrxn .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zswrxcyrxn .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#zswrxcyrxn .gt_left {
  text-align: left;
}

#zswrxcyrxn .gt_center {
  text-align: center;
}

#zswrxcyrxn .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#zswrxcyrxn .gt_font_normal {
  font-weight: normal;
}

#zswrxcyrxn .gt_font_bold {
  font-weight: bold;
}

#zswrxcyrxn .gt_font_italic {
  font-style: italic;
}

#zswrxcyrxn .gt_super {
  font-size: 65%;
}

#zswrxcyrxn .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="zswrxcyrxn" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">country_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_1995</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->

]

.right5[

After:

<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#tgsibbctsa .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#tgsibbctsa .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#tgsibbctsa .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#tgsibbctsa .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#tgsibbctsa .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tgsibbctsa .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#tgsibbctsa .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#tgsibbctsa .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#tgsibbctsa .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#tgsibbctsa .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#tgsibbctsa .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#tgsibbctsa .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#tgsibbctsa .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#tgsibbctsa .gt_from_md > :first-child {
  margin-top: 0;
}

#tgsibbctsa .gt_from_md > :last-child {
  margin-bottom: 0;
}

#tgsibbctsa .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#tgsibbctsa .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#tgsibbctsa .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#tgsibbctsa .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#tgsibbctsa .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#tgsibbctsa .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#tgsibbctsa .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#tgsibbctsa .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tgsibbctsa .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#tgsibbctsa .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#tgsibbctsa .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#tgsibbctsa .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#tgsibbctsa .gt_left {
  text-align: left;
}

#tgsibbctsa .gt_center {
  text-align: center;
}

#tgsibbctsa .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#tgsibbctsa .gt_font_normal {
  font-weight: normal;
}

#tgsibbctsa .gt_font_bold {
  font-weight: bold;
}

#tgsibbctsa .gt_font_italic {
  font-style: italic;
}

#tgsibbctsa .gt_super {
  font-size: 65%;
}

#tgsibbctsa .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="tgsibbctsa" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">country_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_1995</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_left">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
    </tr>
    <tr>
      <td class="gt_row gt_left">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
    </tr>
  </tbody>
  
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="4">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          This is a footnote
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->

]

  ] 

<!-- panel ends here -->

.panel[.panel-name[Locations]

.left-full[

In specifying the locations of the table you modify, you can use `cells_*()` functions. Some of those are (see the **Helper Functions** section of [here](https://gt.rstudio.com/reference/index.html) for the full list.):    

+ `cells_title()`: targets the table title or the table subtitle depending on the value given to the groups argument ("title" or "subtitle").
+ `cells_column_labels()`: targets the column labels.
+ `cells_row_groups()`: targets the row group labels in any available row groups using the groups argument.
+ `cells_stub()`: targets row labels in the table stub using the rows argument.
+ `cells_body()`: targets data cells in the table body using intersections of columns and rows.

Each of these functions have their own ways of specifying where exactly you want to target.

]

  ]

<!-- panel ends here -->

.panel[.panel-name[Locations examples]

<span style="color:blue"> Example 1: </span>


```r
locations = cells_column_labels(columns = vars(y_2015)) 
```

This will target the `y_2015` column label.

<span style="color:blue"> Example 2: </span>


```r
locations = cells_title(groups = "title")
```

This will target the title of the table.

<span style="color:blue"> Example 3: </span>


```r
locations = cells_body(
  columns = starts_with("y_"),
  rows = y_2015 > 100000  
)
```

This will target the cells of the table body (the cells that have values) that  

+ are in the columns whose labels start with `y_` (`y_1995`, `y_2005`, and `y_2015`) 
+ are in the rows where the value of the cells are greater than 100000

  ] 

<!-- panel ends here -->

.panel[.panel-name[columns and rows]

Here are the options you have for `columns = ` and `rows = ` in specifying the target locations.

.blue[`columns`]:

+ explicitly name the columns with `vars(variable name 1, variable 2, ...)`
+ use helper functions like `starts_with()`, `everything()`, etc (you saw these in the data wrangling lecture slides!)

.blue[`rows`]:

+ use logical evaluation expressions like `variable <= values` (e.g., `rows = pop_ratio_10_15 >= 1.2`)
+ use helper functions

  ] 

<!-- panel ends here -->


]

<!-- panel set ends here -->

---



count: false
 
# Demonstrations 1: Create Parts
.panel1-gt-create-user[

```r
*gt_1 <- tab_data

gt_1
```
]
 
.panel2-gt-create-user[

```
## # A tibble: 10 x 7
##    country_name region y_1995 y_2005 y_2015
##    <chr>        <chr>   <int>  <int>  <int>
##  1 Australia    Austr… 1.81e7 2.04e7 2.39e7
##  2 New Zealand  Austr… 3.67e6 4.13e6 4.60e6
##  3 Papua New G… Melan… 4.89e6 6.31e6 7.92e6
##  4 Solomon Isl… Melan… 3.59e5 4.70e5 5.87e5
##  5 New Caledon… Melan… 1.94e5 2.32e5 2.72e5
##  6 Vanuatu      Melan… 1.68e5 2.09e5 2.65e5
##  7 French Poly… Polyn… 2.15e5 2.55e5 2.78e5
##  8 Samoa        Polyn… 1.70e5 1.80e5 1.94e5
##  9 Tonga        Polyn… 9.61e4 1.01e5 1.06e5
## 10 Tuvalu       Polyn… 9.23e3 1.00e4 1.10e4
## # … with 2 more variables: pop_ratio_10_15 <dbl>,
## #   date <chr>
```
]

---
count: false
 
# Demonstrations 1: Create Parts
.panel1-gt-create-user[

```r
gt_1 <- tab_data %>%
* gt(
*   rowname_col = "country_name",
*   groupname_col = "region"
* )

gt_1
```
]
 
.panel2-gt-create-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#doffqbpdlk .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#doffqbpdlk .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#doffqbpdlk .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#doffqbpdlk .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#doffqbpdlk .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#doffqbpdlk .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#doffqbpdlk .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#doffqbpdlk .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#doffqbpdlk .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#doffqbpdlk .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#doffqbpdlk .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#doffqbpdlk .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#doffqbpdlk .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#doffqbpdlk .gt_from_md > :first-child {
  margin-top: 0;
}

#doffqbpdlk .gt_from_md > :last-child {
  margin-bottom: 0;
}

#doffqbpdlk .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#doffqbpdlk .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#doffqbpdlk .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#doffqbpdlk .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#doffqbpdlk .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#doffqbpdlk .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#doffqbpdlk .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#doffqbpdlk .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#doffqbpdlk .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#doffqbpdlk .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#doffqbpdlk .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#doffqbpdlk .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#doffqbpdlk .gt_left {
  text-align: left;
}

#doffqbpdlk .gt_center {
  text-align: center;
}

#doffqbpdlk .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#doffqbpdlk .gt_font_normal {
  font-weight: normal;
}

#doffqbpdlk .gt_font_bold {
  font-weight: bold;
}

#doffqbpdlk .gt_font_italic {
  font-style: italic;
}

#doffqbpdlk .gt_super {
  font-size: 65%;
}

#doffqbpdlk .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="doffqbpdlk" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1"></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_1995</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">date</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center">168235</td>
      <td class="gt_row gt_center">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center">215196</td>
      <td class="gt_row gt_center">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center">170157</td>
      <td class="gt_row gt_center">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center">96076</td>
      <td class="gt_row gt_center">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center">9230</td>
      <td class="gt_row gt_center">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 1: Create Parts
.panel1-gt-create-user[

```r
gt_1 <- tab_data %>%
  gt(
    rowname_col = "country_name",
    groupname_col = "region"
  ) %>%
* tab_header(
*   title = "Populations of Oceania's Countries in 1995, 2005, and 2015",
*   subtitle = md("`exibble` is an R dataset")
* )

gt_1
```
]
 
.panel2-gt-create-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#kfttlxxitp .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#kfttlxxitp .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kfttlxxitp .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#kfttlxxitp .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#kfttlxxitp .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kfttlxxitp .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kfttlxxitp .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#kfttlxxitp .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#kfttlxxitp .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#kfttlxxitp .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#kfttlxxitp .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#kfttlxxitp .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#kfttlxxitp .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#kfttlxxitp .gt_from_md > :first-child {
  margin-top: 0;
}

#kfttlxxitp .gt_from_md > :last-child {
  margin-bottom: 0;
}

#kfttlxxitp .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#kfttlxxitp .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#kfttlxxitp .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kfttlxxitp .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#kfttlxxitp .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kfttlxxitp .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#kfttlxxitp .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#kfttlxxitp .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kfttlxxitp .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kfttlxxitp .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#kfttlxxitp .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kfttlxxitp .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#kfttlxxitp .gt_left {
  text-align: left;
}

#kfttlxxitp .gt_center {
  text-align: center;
}

#kfttlxxitp .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#kfttlxxitp .gt_font_normal {
  font-weight: normal;
}

#kfttlxxitp .gt_font_bold {
  font-weight: bold;
}

#kfttlxxitp .gt_font_italic {
  font-style: italic;
}

#kfttlxxitp .gt_super {
  font-size: 65%;
}

#kfttlxxitp .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="kfttlxxitp" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1"></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_1995</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">date</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center">168235</td>
      <td class="gt_row gt_center">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center">215196</td>
      <td class="gt_row gt_center">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center">170157</td>
      <td class="gt_row gt_center">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center">96076</td>
      <td class="gt_row gt_center">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center">9230</td>
      <td class="gt_row gt_center">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 1: Create Parts
.panel1-gt-create-user[

```r
gt_1 <- tab_data %>%
  gt(
    rowname_col = "country_name",
    groupname_col = "region"
  ) %>%
  tab_header(
    title = "Populations of Oceania's Countries in 1995, 2005, and 2015",
    subtitle = md("`exibble` is an R dataset")
  ) %>%
* tab_spanner(
*   label = "2000s",
*   columns = vars(y_2005, y_2015)
* )

gt_1
```
]
 
.panel2-gt-create-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#qsajjizrjl .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#qsajjizrjl .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#qsajjizrjl .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#qsajjizrjl .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#qsajjizrjl .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qsajjizrjl .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#qsajjizrjl .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#qsajjizrjl .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#qsajjizrjl .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#qsajjizrjl .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#qsajjizrjl .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#qsajjizrjl .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#qsajjizrjl .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#qsajjizrjl .gt_from_md > :first-child {
  margin-top: 0;
}

#qsajjizrjl .gt_from_md > :last-child {
  margin-bottom: 0;
}

#qsajjizrjl .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#qsajjizrjl .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#qsajjizrjl .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#qsajjizrjl .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#qsajjizrjl .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#qsajjizrjl .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#qsajjizrjl .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#qsajjizrjl .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#qsajjizrjl .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#qsajjizrjl .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#qsajjizrjl .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#qsajjizrjl .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#qsajjizrjl .gt_left {
  text-align: left;
}

#qsajjizrjl .gt_center {
  text-align: center;
}

#qsajjizrjl .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#qsajjizrjl .gt_font_normal {
  font-weight: normal;
}

#qsajjizrjl .gt_font_bold {
  font-weight: bold;
}

#qsajjizrjl .gt_font_italic {
  font-style: italic;
}

#qsajjizrjl .gt_super {
  font-size: 65%;
}

#qsajjizrjl .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="qsajjizrjl" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1"></th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center">168235</td>
      <td class="gt_row gt_center">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center">215196</td>
      <td class="gt_row gt_center">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center">170157</td>
      <td class="gt_row gt_center">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center">96076</td>
      <td class="gt_row gt_center">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center">9230</td>
      <td class="gt_row gt_center">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 1: Create Parts
.panel1-gt-create-user[

```r
gt_1 <- tab_data %>%
  gt(
    rowname_col = "country_name",
    groupname_col = "region"
  ) %>%
  tab_header(
    title = "Populations of Oceania's Countries in 1995, 2005, and 2015",
    subtitle = md("`exibble` is an R dataset")
  ) %>%
  tab_spanner(
    label = "2000s",
    columns = vars(y_2005, y_2015)
  ) %>%
* tab_stubhead(
*   label = "Country/Region"
* )

gt_1
```
]
 
.panel2-gt-create-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#wcausbhbfb .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#wcausbhbfb .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#wcausbhbfb .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#wcausbhbfb .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#wcausbhbfb .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#wcausbhbfb .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#wcausbhbfb .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#wcausbhbfb .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#wcausbhbfb .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#wcausbhbfb .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#wcausbhbfb .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#wcausbhbfb .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#wcausbhbfb .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#wcausbhbfb .gt_from_md > :first-child {
  margin-top: 0;
}

#wcausbhbfb .gt_from_md > :last-child {
  margin-bottom: 0;
}

#wcausbhbfb .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#wcausbhbfb .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#wcausbhbfb .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#wcausbhbfb .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#wcausbhbfb .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#wcausbhbfb .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#wcausbhbfb .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#wcausbhbfb .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#wcausbhbfb .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#wcausbhbfb .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#wcausbhbfb .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#wcausbhbfb .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#wcausbhbfb .gt_left {
  text-align: left;
}

#wcausbhbfb .gt_center {
  text-align: center;
}

#wcausbhbfb .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#wcausbhbfb .gt_font_normal {
  font-weight: normal;
}

#wcausbhbfb .gt_font_bold {
  font-weight: bold;
}

#wcausbhbfb .gt_font_italic {
  font-style: italic;
}

#wcausbhbfb .gt_super {
  font-size: 65%;
}

#wcausbhbfb .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="wcausbhbfb" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center">168235</td>
      <td class="gt_row gt_center">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center">215196</td>
      <td class="gt_row gt_center">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center">170157</td>
      <td class="gt_row gt_center">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center">96076</td>
      <td class="gt_row gt_center">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center">9230</td>
      <td class="gt_row gt_center">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  
  
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 1: Create Parts
.panel1-gt-create-user[

```r
gt_1 <- tab_data %>%
  gt(
    rowname_col = "country_name",
    groupname_col = "region"
  ) %>%
  tab_header(
    title = "Populations of Oceania's Countries in 1995, 2005, and 2015",
    subtitle = md("`exibble` is an R dataset")
  ) %>%
  tab_spanner(
    label = "2000s",
    columns = vars(y_2005, y_2015)
  ) %>%
  tab_stubhead(
    label = "Country/Region"
  ) %>%
* tab_footnote(
*   footnote = "This is the last year",
*   locations = cells_column_labels(
*     columns = vars(y_2015)
*   )
* )

gt_1
```
]
 
.panel2-gt-create-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ocfzqcgwjh .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#ocfzqcgwjh .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ocfzqcgwjh .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#ocfzqcgwjh .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#ocfzqcgwjh .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ocfzqcgwjh .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ocfzqcgwjh .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#ocfzqcgwjh .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#ocfzqcgwjh .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ocfzqcgwjh .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ocfzqcgwjh .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#ocfzqcgwjh .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#ocfzqcgwjh .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#ocfzqcgwjh .gt_from_md > :first-child {
  margin-top: 0;
}

#ocfzqcgwjh .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ocfzqcgwjh .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#ocfzqcgwjh .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#ocfzqcgwjh .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ocfzqcgwjh .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#ocfzqcgwjh .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ocfzqcgwjh .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ocfzqcgwjh .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ocfzqcgwjh .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ocfzqcgwjh .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ocfzqcgwjh .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#ocfzqcgwjh .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ocfzqcgwjh .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#ocfzqcgwjh .gt_left {
  text-align: left;
}

#ocfzqcgwjh .gt_center {
  text-align: center;
}

#ocfzqcgwjh .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ocfzqcgwjh .gt_font_normal {
  font-weight: normal;
}

#ocfzqcgwjh .gt_font_bold {
  font-weight: bold;
}

#ocfzqcgwjh .gt_font_italic {
  font-style: italic;
}

#ocfzqcgwjh .gt_super {
  font-size: 65%;
}

#ocfzqcgwjh .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="ocfzqcgwjh" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center">168235</td>
      <td class="gt_row gt_center">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center">215196</td>
      <td class="gt_row gt_center">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center">170157</td>
      <td class="gt_row gt_center">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center">96076</td>
      <td class="gt_row gt_center">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center">9230</td>
      <td class="gt_row gt_center">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 1: Create Parts
.panel1-gt-create-user[

```r
gt_1 <- tab_data %>%
  gt(
    rowname_col = "country_name",
    groupname_col = "region"
  ) %>%
  tab_header(
    title = "Populations of Oceania's Countries in 1995, 2005, and 2015",
    subtitle = md("`exibble` is an R dataset")
  ) %>%
  tab_spanner(
    label = "2000s",
    columns = vars(y_2005, y_2015)
  ) %>%
  tab_stubhead(
    label = "Country/Region"
  ) %>%
  tab_footnote(
    footnote = "This is the last year",
    locations = cells_column_labels(
      columns = vars(y_2015)
    )
  ) %>%
* tab_source_note(
*   source_note = md("From the `gt` package")
* )

gt_1
```
]
 
.panel2-gt-create-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#hpsgjfpomq .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#hpsgjfpomq .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hpsgjfpomq .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#hpsgjfpomq .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#hpsgjfpomq .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hpsgjfpomq .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hpsgjfpomq .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#hpsgjfpomq .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#hpsgjfpomq .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#hpsgjfpomq .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#hpsgjfpomq .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#hpsgjfpomq .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#hpsgjfpomq .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#hpsgjfpomq .gt_from_md > :first-child {
  margin-top: 0;
}

#hpsgjfpomq .gt_from_md > :last-child {
  margin-bottom: 0;
}

#hpsgjfpomq .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#hpsgjfpomq .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#hpsgjfpomq .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hpsgjfpomq .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#hpsgjfpomq .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hpsgjfpomq .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#hpsgjfpomq .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#hpsgjfpomq .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hpsgjfpomq .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hpsgjfpomq .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#hpsgjfpomq .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hpsgjfpomq .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#hpsgjfpomq .gt_left {
  text-align: left;
}

#hpsgjfpomq .gt_center {
  text-align: center;
}

#hpsgjfpomq .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#hpsgjfpomq .gt_font_normal {
  font-weight: normal;
}

#hpsgjfpomq .gt_font_bold {
  font-weight: bold;
}

#hpsgjfpomq .gt_font_italic {
  font-style: italic;
}

#hpsgjfpomq .gt_super {
  font-size: 65%;
}

#hpsgjfpomq .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="hpsgjfpomq" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center">168235</td>
      <td class="gt_row gt_center">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center">215196</td>
      <td class="gt_row gt_center">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center">170157</td>
      <td class="gt_row gt_center">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center">96076</td>
      <td class="gt_row gt_center">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center">9230</td>
      <td class="gt_row gt_center">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

<style>
.panel1-gt-create-user {
  color: black;
  width: 44.1%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel2-gt-create-user {
  color: black;
  width: 53.9%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel3-gt-create-user {
  color: black;
  width: NA%;
  hight: 33%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
</style>



---

# `tab_style()` and `tab_options()`

.panelset[ 

.panel[.panel-name[tab_style()]

.left-full[

You can use `tab_style()` to add custom styles to one or more cells. It consists of two parts:

+ `style` where you specify the style you would like to add  
+ `location` where you you specify where in the table you would like to apply the `style`  

<br>

.blue[Example]:


```r
tab_style(
  style = list(
    cell_fill(color = "lightcyan"),
    ),
  locations = cells_body(
    columns = vars(pop_ratio_10_15),
    rows = pop_ratio_10_15 >= 1.2 # this is like `dplyr::filter()`
  )
) 
```

This will work on the cells with their values greater than 1.2 (`rows = pop_ratio_10_15 >= 1.2`) in the `pop_ratio_10_15` column (`columns = vars(pop_ratio_10_15)`) to make the cell fill color `lightcyan` (`cell_fill(color = "lightcyan")`)

]

  ]

<!-- panel ends here -->

.panel[.panel-name[style()]

.left-full[

You use a series of `cell_*()` functions to direct your modification requests to specific parts of the **cells** in `style()`:

+ cell_fill()
+ cell_text()
+ cell_body()
+ cell_borders()

Inside these `cell_*()` functions, you specify what you want to do to the parts of the cells that you refer to with `cell_*()` functions. 

Some of the options are

+ `color`
+ `size`
+ `width`
+ `alpha`

To see the full list of options available, run `?cell_*()` to see their individual help pages.

]

  ] 

<!-- panel ends here -->

.panel[.panel-name[tab_options()]

.left-full[

You can control the style (theme) of a `gt` table using the `tab_options()` function. 

You can control virtually any part of a table with it (see [here](https://gt.rstudio.com/reference/tab_options.html) for the complete options you have).

Here is a few of the options:

+ `table.border.bottom.width`
+ `column_labels.vlines.width`
+ `row_group.border.left.color` 

You can easily feel how much control you have over the style of a table by just looking at these options...

.red[Note]: Unlike the other functions we have looked at, these options specify the actions (e.g., change `width`) and locations (e.g., `table.border.bottom`).

<br>

.blue[Example]:


```r
tab_options(
  footnotes.marks = letters, 
  heading.subtitle.font.size = px(20)
)
```

+ The first one changes the footnote marks to letters (e.g., "a", "b", ..) from numbers (e.g., 1, 2, ...) 
+ The second one changes the font size of the subtitle to 20 px. 

]

  ] 

  <!-- panel ends here -->

]

<!-- panel set ends here -->

---



count: false
 
# Demonstrations 2: tab_style()
.panel1-gt-tab-styles-user[

```r
*gt_2 <- gt_1

gt_2
```
]
 
.panel2-gt-tab-styles-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#lepdymdset .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#lepdymdset .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#lepdymdset .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#lepdymdset .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#lepdymdset .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#lepdymdset .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#lepdymdset .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#lepdymdset .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#lepdymdset .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#lepdymdset .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#lepdymdset .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#lepdymdset .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#lepdymdset .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#lepdymdset .gt_from_md > :first-child {
  margin-top: 0;
}

#lepdymdset .gt_from_md > :last-child {
  margin-bottom: 0;
}

#lepdymdset .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#lepdymdset .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#lepdymdset .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#lepdymdset .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#lepdymdset .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#lepdymdset .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#lepdymdset .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#lepdymdset .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#lepdymdset .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#lepdymdset .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#lepdymdset .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#lepdymdset .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#lepdymdset .gt_left {
  text-align: left;
}

#lepdymdset .gt_center {
  text-align: center;
}

#lepdymdset .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#lepdymdset .gt_font_normal {
  font-weight: normal;
}

#lepdymdset .gt_font_bold {
  font-weight: bold;
}

#lepdymdset .gt_font_italic {
  font-style: italic;
}

#lepdymdset .gt_super {
  font-size: 65%;
}

#lepdymdset .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="lepdymdset" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center">168235</td>
      <td class="gt_row gt_center">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center">215196</td>
      <td class="gt_row gt_center">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center">170157</td>
      <td class="gt_row gt_center">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center">96076</td>
      <td class="gt_row gt_center">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center">9230</td>
      <td class="gt_row gt_center">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 2: tab_style()
.panel1-gt-tab-styles-user[

```r
gt_2 <- gt_1 %>%
* tab_style(
*   style = list(
*     cell_fill(color = "red")
*     ),
*   locations = cells_body(
*     columns = vars(pop_ratio_10_15),
*     rows = pop_ratio_10_15 >= 1.2
*   )
* )

gt_2
```
]
 
.panel2-gt-tab-styles-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#skxzgvdbio .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#skxzgvdbio .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#skxzgvdbio .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#skxzgvdbio .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#skxzgvdbio .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#skxzgvdbio .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#skxzgvdbio .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#skxzgvdbio .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#skxzgvdbio .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#skxzgvdbio .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#skxzgvdbio .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#skxzgvdbio .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#skxzgvdbio .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#skxzgvdbio .gt_from_md > :first-child {
  margin-top: 0;
}

#skxzgvdbio .gt_from_md > :last-child {
  margin-bottom: 0;
}

#skxzgvdbio .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#skxzgvdbio .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#skxzgvdbio .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#skxzgvdbio .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#skxzgvdbio .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#skxzgvdbio .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#skxzgvdbio .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#skxzgvdbio .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#skxzgvdbio .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#skxzgvdbio .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#skxzgvdbio .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#skxzgvdbio .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#skxzgvdbio .gt_left {
  text-align: left;
}

#skxzgvdbio .gt_center {
  text-align: center;
}

#skxzgvdbio .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#skxzgvdbio .gt_font_normal {
  font-weight: normal;
}

#skxzgvdbio .gt_font_bold {
  font-weight: bold;
}

#skxzgvdbio .gt_font_italic {
  font-style: italic;
}

#skxzgvdbio .gt_super {
  font-size: 65%;
}

#skxzgvdbio .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="skxzgvdbio" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center">168235</td>
      <td class="gt_row gt_center">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center">215196</td>
      <td class="gt_row gt_center">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center">170157</td>
      <td class="gt_row gt_center">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center">96076</td>
      <td class="gt_row gt_center">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center">9230</td>
      <td class="gt_row gt_center">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 2: tab_style()
.panel1-gt-tab-styles-user[

```r
gt_2 <- gt_1 %>%
  tab_style(
    style = list(
      cell_fill(color = "red")
      ),
    locations = cells_body(
      columns = vars(pop_ratio_10_15),
      rows = pop_ratio_10_15 >= 1.2
    )
  ) %>%
* tab_style(
*   style = list(
*     cell_borders(sides = "top", style =  "dotted"),
*     cell_text(
*       weight = "bold",
*       style = "italic",
*       color = "#E50000"
*     )
*   ),
*   locations = cells_body(
*     columns = vars(y_1995),
*     rows = y_1995 < 300000
*   )
* )

gt_2
```
]
 
.panel2-gt-tab-styles-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#xvajzonxbu .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#xvajzonxbu .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#xvajzonxbu .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#xvajzonxbu .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#xvajzonxbu .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#xvajzonxbu .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#xvajzonxbu .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#xvajzonxbu .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#xvajzonxbu .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#xvajzonxbu .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#xvajzonxbu .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#xvajzonxbu .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#xvajzonxbu .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#xvajzonxbu .gt_from_md > :first-child {
  margin-top: 0;
}

#xvajzonxbu .gt_from_md > :last-child {
  margin-bottom: 0;
}

#xvajzonxbu .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#xvajzonxbu .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#xvajzonxbu .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#xvajzonxbu .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#xvajzonxbu .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#xvajzonxbu .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#xvajzonxbu .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#xvajzonxbu .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#xvajzonxbu .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#xvajzonxbu .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#xvajzonxbu .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#xvajzonxbu .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#xvajzonxbu .gt_left {
  text-align: left;
}

#xvajzonxbu .gt_center {
  text-align: center;
}

#xvajzonxbu .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#xvajzonxbu .gt_font_normal {
  font-weight: normal;
}

#xvajzonxbu .gt_font_bold {
  font-weight: bold;
}

#xvajzonxbu .gt_font_italic {
  font-style: italic;
}

#xvajzonxbu .gt_super {
  font-size: 65%;
}

#xvajzonxbu .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="xvajzonxbu" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168235</td>
      <td class="gt_row gt_center">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215196</td>
      <td class="gt_row gt_center">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170157</td>
      <td class="gt_row gt_center">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96076</td>
      <td class="gt_row gt_center">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9230</td>
      <td class="gt_row gt_center">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 2: tab_style()
.panel1-gt-tab-styles-user[

```r
gt_2 <- gt_1 %>%
  tab_style(
    style = list(
      cell_fill(color = "red")
      ),
    locations = cells_body(
      columns = vars(pop_ratio_10_15),
      rows = pop_ratio_10_15 >= 1.2
    )
  ) %>%
  tab_style(
    style = list(
      cell_borders(sides = "top", style =  "dotted"),
      cell_text(
        weight = "bold",
        style = "italic",
        color = "#E50000"
      )
    ),
    locations = cells_body(
      columns = vars(y_1995),
      rows = y_1995 < 300000
    )
  ) %>%
* tab_style(
*   style = list(
*     cell_text(
*       size = px(10),
*       align = "right",
*       v_align = "top",
*       decorate = "underline"
*       )
*     ),
*   locations = cells_body(columns = vars(y_2005))
* )

gt_2
```
]
 
.panel2-gt-tab-styles-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ogcanxhobg .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#ogcanxhobg .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ogcanxhobg .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#ogcanxhobg .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#ogcanxhobg .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ogcanxhobg .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ogcanxhobg .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#ogcanxhobg .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#ogcanxhobg .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ogcanxhobg .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ogcanxhobg .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#ogcanxhobg .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#ogcanxhobg .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#ogcanxhobg .gt_from_md > :first-child {
  margin-top: 0;
}

#ogcanxhobg .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ogcanxhobg .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#ogcanxhobg .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#ogcanxhobg .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ogcanxhobg .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#ogcanxhobg .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ogcanxhobg .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ogcanxhobg .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ogcanxhobg .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ogcanxhobg .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ogcanxhobg .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#ogcanxhobg .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ogcanxhobg .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#ogcanxhobg .gt_left {
  text-align: left;
}

#ogcanxhobg .gt_center {
  text-align: center;
}

#ogcanxhobg .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ogcanxhobg .gt_font_normal {
  font-weight: normal;
}

#ogcanxhobg .gt_font_bold {
  font-weight: bold;
}

#ogcanxhobg .gt_font_italic {
  font-style: italic;
}

#ogcanxhobg .gt_super {
  font-size: 65%;
}

#ogcanxhobg .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="ogcanxhobg" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193816</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168235</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215196</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170157</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96076</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9230</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

<style>
.panel1-gt-tab-styles-user {
  color: black;
  width: 44.1%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel2-gt-tab-styles-user {
  color: black;
  width: 53.9%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel3-gt-tab-styles-user {
  color: black;
  width: NA%;
  hight: 33%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
</style>




---



count: false
 
# Demonstrations 3: tab_options()
.panel1-tab-options-non_seq[

```r
gt_3 <- gt_2 %>%
  tab_options(
  )


gt_3
```
]
 
.panel2-tab-options-non_seq[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#jwdgbvsejr .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#jwdgbvsejr .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#jwdgbvsejr .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#jwdgbvsejr .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#jwdgbvsejr .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jwdgbvsejr .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#jwdgbvsejr .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#jwdgbvsejr .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#jwdgbvsejr .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#jwdgbvsejr .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#jwdgbvsejr .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#jwdgbvsejr .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#jwdgbvsejr .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#jwdgbvsejr .gt_from_md > :first-child {
  margin-top: 0;
}

#jwdgbvsejr .gt_from_md > :last-child {
  margin-bottom: 0;
}

#jwdgbvsejr .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#jwdgbvsejr .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#jwdgbvsejr .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jwdgbvsejr .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#jwdgbvsejr .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#jwdgbvsejr .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#jwdgbvsejr .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#jwdgbvsejr .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#jwdgbvsejr .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#jwdgbvsejr .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#jwdgbvsejr .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#jwdgbvsejr .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#jwdgbvsejr .gt_left {
  text-align: left;
}

#jwdgbvsejr .gt_center {
  text-align: center;
}

#jwdgbvsejr .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#jwdgbvsejr .gt_font_normal {
  font-weight: normal;
}

#jwdgbvsejr .gt_font_bold {
  font-weight: bold;
}

#jwdgbvsejr .gt_font_italic {
  font-style: italic;
}

#jwdgbvsejr .gt_super {
  font-size: 65%;
}

#jwdgbvsejr .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="jwdgbvsejr" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193816</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168235</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215196</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170157</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96076</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9230</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 3: tab_options()
.panel1-tab-options-non_seq[

```r
gt_3 <- gt_2 %>%
  tab_options(
*   table.background.color = "lightcyan",
  )


gt_3
```
]
 
.panel2-tab-options-non_seq[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#fzkbvlutcf .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#fzkbvlutcf .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#fzkbvlutcf .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#fzkbvlutcf .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#fzkbvlutcf .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fzkbvlutcf .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#fzkbvlutcf .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#fzkbvlutcf .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#fzkbvlutcf .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#fzkbvlutcf .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#fzkbvlutcf .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#fzkbvlutcf .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#fzkbvlutcf .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#fzkbvlutcf .gt_from_md > :first-child {
  margin-top: 0;
}

#fzkbvlutcf .gt_from_md > :last-child {
  margin-bottom: 0;
}

#fzkbvlutcf .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#fzkbvlutcf .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#fzkbvlutcf .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#fzkbvlutcf .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#fzkbvlutcf .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#fzkbvlutcf .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#fzkbvlutcf .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#fzkbvlutcf .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#fzkbvlutcf .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#fzkbvlutcf .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#fzkbvlutcf .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#fzkbvlutcf .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#fzkbvlutcf .gt_left {
  text-align: left;
}

#fzkbvlutcf .gt_center {
  text-align: center;
}

#fzkbvlutcf .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#fzkbvlutcf .gt_font_normal {
  font-weight: normal;
}

#fzkbvlutcf .gt_font_bold {
  font-weight: bold;
}

#fzkbvlutcf .gt_font_italic {
  font-style: italic;
}

#fzkbvlutcf .gt_super {
  font-size: 65%;
}

#fzkbvlutcf .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="fzkbvlutcf" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193816</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168235</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215196</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170157</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96076</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9230</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 3: tab_options()
.panel1-tab-options-non_seq[

```r
gt_3 <- gt_2 %>%
  tab_options(
    table.background.color = "lightcyan",
*   footnotes.marks = letters,
  )


gt_3
```
]
 
.panel2-tab-options-non_seq[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#rldpzgxtwj .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#rldpzgxtwj .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#rldpzgxtwj .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#rldpzgxtwj .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#rldpzgxtwj .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rldpzgxtwj .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#rldpzgxtwj .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#rldpzgxtwj .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#rldpzgxtwj .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#rldpzgxtwj .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#rldpzgxtwj .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#rldpzgxtwj .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#rldpzgxtwj .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#rldpzgxtwj .gt_from_md > :first-child {
  margin-top: 0;
}

#rldpzgxtwj .gt_from_md > :last-child {
  margin-bottom: 0;
}

#rldpzgxtwj .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#rldpzgxtwj .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#rldpzgxtwj .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rldpzgxtwj .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#rldpzgxtwj .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rldpzgxtwj .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#rldpzgxtwj .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#rldpzgxtwj .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rldpzgxtwj .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#rldpzgxtwj .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#rldpzgxtwj .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#rldpzgxtwj .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#rldpzgxtwj .gt_left {
  text-align: left;
}

#rldpzgxtwj .gt_center {
  text-align: center;
}

#rldpzgxtwj .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#rldpzgxtwj .gt_font_normal {
  font-weight: normal;
}

#rldpzgxtwj .gt_font_bold {
  font-weight: bold;
}

#rldpzgxtwj .gt_font_italic {
  font-style: italic;
}

#rldpzgxtwj .gt_super {
  font-size: 65%;
}

#rldpzgxtwj .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="rldpzgxtwj" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193816</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168235</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215196</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170157</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96076</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9230</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 3: tab_options()
.panel1-tab-options-non_seq[

```r
gt_3 <- gt_2 %>%
  tab_options(
    table.background.color = "lightcyan",
    footnotes.marks = letters,
*   data_row.padding = px(5),
  )


gt_3
```
]
 
.panel2-tab-options-non_seq[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#zbymhyjfim .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#zbymhyjfim .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zbymhyjfim .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#zbymhyjfim .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#zbymhyjfim .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zbymhyjfim .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zbymhyjfim .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#zbymhyjfim .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#zbymhyjfim .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#zbymhyjfim .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#zbymhyjfim .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#zbymhyjfim .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#zbymhyjfim .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#zbymhyjfim .gt_from_md > :first-child {
  margin-top: 0;
}

#zbymhyjfim .gt_from_md > :last-child {
  margin-bottom: 0;
}

#zbymhyjfim .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#zbymhyjfim .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#zbymhyjfim .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zbymhyjfim .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#zbymhyjfim .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zbymhyjfim .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#zbymhyjfim .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#zbymhyjfim .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zbymhyjfim .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zbymhyjfim .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#zbymhyjfim .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zbymhyjfim .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#zbymhyjfim .gt_left {
  text-align: left;
}

#zbymhyjfim .gt_center {
  text-align: center;
}

#zbymhyjfim .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#zbymhyjfim .gt_font_normal {
  font-weight: normal;
}

#zbymhyjfim .gt_font_bold {
  font-weight: bold;
}

#zbymhyjfim .gt_font_italic {
  font-style: italic;
}

#zbymhyjfim .gt_super {
  font-size: 65%;
}

#zbymhyjfim .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="zbymhyjfim" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193816</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168235</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215196</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170157</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96076</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9230</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 3: tab_options()
.panel1-tab-options-non_seq[

```r
gt_3 <- gt_2 %>%
  tab_options(
    table.background.color = "lightcyan",
    footnotes.marks = letters,
    data_row.padding = px(5),
*   heading.subtitle.font.size = px(20),
  )


gt_3
```
]
 
.panel2-tab-options-non_seq[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#lbtbhbjvfl .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#lbtbhbjvfl .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#lbtbhbjvfl .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#lbtbhbjvfl .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#lbtbhbjvfl .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#lbtbhbjvfl .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#lbtbhbjvfl .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#lbtbhbjvfl .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#lbtbhbjvfl .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#lbtbhbjvfl .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#lbtbhbjvfl .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#lbtbhbjvfl .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#lbtbhbjvfl .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#lbtbhbjvfl .gt_from_md > :first-child {
  margin-top: 0;
}

#lbtbhbjvfl .gt_from_md > :last-child {
  margin-bottom: 0;
}

#lbtbhbjvfl .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#lbtbhbjvfl .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#lbtbhbjvfl .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#lbtbhbjvfl .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#lbtbhbjvfl .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#lbtbhbjvfl .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#lbtbhbjvfl .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#lbtbhbjvfl .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#lbtbhbjvfl .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#lbtbhbjvfl .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#lbtbhbjvfl .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#lbtbhbjvfl .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#lbtbhbjvfl .gt_left {
  text-align: left;
}

#lbtbhbjvfl .gt_center {
  text-align: center;
}

#lbtbhbjvfl .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#lbtbhbjvfl .gt_font_normal {
  font-weight: normal;
}

#lbtbhbjvfl .gt_font_bold {
  font-weight: bold;
}

#lbtbhbjvfl .gt_font_italic {
  font-style: italic;
}

#lbtbhbjvfl .gt_super {
  font-size: 65%;
}

#lbtbhbjvfl .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="lbtbhbjvfl" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193816</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168235</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215196</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170157</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96076</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9230</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 3: tab_options()
.panel1-tab-options-non_seq[

```r
gt_3 <- gt_2 %>%
  tab_options(
    table.background.color = "lightcyan",
    footnotes.marks = letters,
    data_row.padding = px(5),
    heading.subtitle.font.size = px(20),
*   source_notes.border.bottom.color ="#B2B2FF",
  )


gt_3
```
]
 
.panel2-tab-options-non_seq[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#bnqbarqaqh .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#bnqbarqaqh .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#bnqbarqaqh .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#bnqbarqaqh .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#bnqbarqaqh .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#bnqbarqaqh .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#bnqbarqaqh .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#bnqbarqaqh .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#bnqbarqaqh .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#bnqbarqaqh .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#bnqbarqaqh .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#bnqbarqaqh .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#bnqbarqaqh .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#bnqbarqaqh .gt_from_md > :first-child {
  margin-top: 0;
}

#bnqbarqaqh .gt_from_md > :last-child {
  margin-bottom: 0;
}

#bnqbarqaqh .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#bnqbarqaqh .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#bnqbarqaqh .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#bnqbarqaqh .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#bnqbarqaqh .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#bnqbarqaqh .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#bnqbarqaqh .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#bnqbarqaqh .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#bnqbarqaqh .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#bnqbarqaqh .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#bnqbarqaqh .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#bnqbarqaqh .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#bnqbarqaqh .gt_left {
  text-align: left;
}

#bnqbarqaqh .gt_center {
  text-align: center;
}

#bnqbarqaqh .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#bnqbarqaqh .gt_font_normal {
  font-weight: normal;
}

#bnqbarqaqh .gt_font_bold {
  font-weight: bold;
}

#bnqbarqaqh .gt_font_italic {
  font-style: italic;
}

#bnqbarqaqh .gt_super {
  font-size: 65%;
}

#bnqbarqaqh .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="bnqbarqaqh" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193816</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168235</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215196</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170157</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96076</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9230</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 3: tab_options()
.panel1-tab-options-non_seq[

```r
gt_3 <- gt_2 %>%
  tab_options(
    table.background.color = "lightcyan",
    footnotes.marks = letters,
    data_row.padding = px(5),
    heading.subtitle.font.size = px(20),
    source_notes.border.bottom.color ="#B2B2FF",
*   row_group.background.color = "#8B008B",
  )


gt_3
```
]
 
.panel2-tab-options-non_seq[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#zyxzhgcesh .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#zyxzhgcesh .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zyxzhgcesh .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#zyxzhgcesh .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#zyxzhgcesh .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zyxzhgcesh .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zyxzhgcesh .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#zyxzhgcesh .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#zyxzhgcesh .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#zyxzhgcesh .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#zyxzhgcesh .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#zyxzhgcesh .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#zyxzhgcesh .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#zyxzhgcesh .gt_from_md > :first-child {
  margin-top: 0;
}

#zyxzhgcesh .gt_from_md > :last-child {
  margin-bottom: 0;
}

#zyxzhgcesh .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#zyxzhgcesh .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#zyxzhgcesh .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zyxzhgcesh .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#zyxzhgcesh .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zyxzhgcesh .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#zyxzhgcesh .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#zyxzhgcesh .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zyxzhgcesh .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zyxzhgcesh .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#zyxzhgcesh .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zyxzhgcesh .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#zyxzhgcesh .gt_left {
  text-align: left;
}

#zyxzhgcesh .gt_center {
  text-align: center;
}

#zyxzhgcesh .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#zyxzhgcesh .gt_font_normal {
  font-weight: normal;
}

#zyxzhgcesh .gt_font_bold {
  font-weight: bold;
}

#zyxzhgcesh .gt_font_italic {
  font-style: italic;
}

#zyxzhgcesh .gt_super {
  font-size: 65%;
}

#zyxzhgcesh .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="zyxzhgcesh" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193816</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168235</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215196</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170157</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96076</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9230</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 3: tab_options()
.panel1-tab-options-non_seq[

```r
gt_3 <- gt_2 %>%
  tab_options(
    table.background.color = "lightcyan",
    footnotes.marks = letters,
    data_row.padding = px(5),
    heading.subtitle.font.size = px(20),
    source_notes.border.bottom.color ="#B2B2FF",
    row_group.background.color = "#8B008B",
*   table.border.bottom.width = px(5),
  )


gt_3
```
]
 
.panel2-tab-options-non_seq[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#igoenhspfw .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#igoenhspfw .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#igoenhspfw .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#igoenhspfw .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#igoenhspfw .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#igoenhspfw .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#igoenhspfw .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#igoenhspfw .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#igoenhspfw .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#igoenhspfw .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#igoenhspfw .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#igoenhspfw .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#igoenhspfw .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#igoenhspfw .gt_from_md > :first-child {
  margin-top: 0;
}

#igoenhspfw .gt_from_md > :last-child {
  margin-bottom: 0;
}

#igoenhspfw .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#igoenhspfw .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#igoenhspfw .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#igoenhspfw .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#igoenhspfw .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#igoenhspfw .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#igoenhspfw .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#igoenhspfw .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#igoenhspfw .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#igoenhspfw .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#igoenhspfw .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#igoenhspfw .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#igoenhspfw .gt_left {
  text-align: left;
}

#igoenhspfw .gt_center {
  text-align: center;
}

#igoenhspfw .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#igoenhspfw .gt_font_normal {
  font-weight: normal;
}

#igoenhspfw .gt_font_bold {
  font-weight: bold;
}

#igoenhspfw .gt_font_italic {
  font-style: italic;
}

#igoenhspfw .gt_super {
  font-size: 65%;
}

#igoenhspfw .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="igoenhspfw" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193816</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168235</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215196</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170157</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96076</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9230</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations 3: tab_options()
.panel1-tab-options-non_seq[

```r
gt_3 <- gt_2 %>%
  tab_options(
    table.background.color = "lightcyan",
    footnotes.marks = letters,
    data_row.padding = px(5),
    heading.subtitle.font.size = px(20),
    source_notes.border.bottom.color ="#B2B2FF",
    row_group.background.color = "#8B008B",
    table.border.bottom.width = px(5),
*   table_body.border.top.color = "green"
  )


gt_3
```
]
 
.panel2-tab-options-non_seq[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ehzgbefpyq .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#ehzgbefpyq .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ehzgbefpyq .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#ehzgbefpyq .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#ehzgbefpyq .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ehzgbefpyq .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ehzgbefpyq .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#ehzgbefpyq .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#ehzgbefpyq .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ehzgbefpyq .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ehzgbefpyq .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#ehzgbefpyq .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#ehzgbefpyq .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#ehzgbefpyq .gt_from_md > :first-child {
  margin-top: 0;
}

#ehzgbefpyq .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ehzgbefpyq .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#ehzgbefpyq .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#ehzgbefpyq .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ehzgbefpyq .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#ehzgbefpyq .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ehzgbefpyq .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ehzgbefpyq .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ehzgbefpyq .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ehzgbefpyq .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ehzgbefpyq .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#ehzgbefpyq .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ehzgbefpyq .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#ehzgbefpyq .gt_left {
  text-align: left;
}

#ehzgbefpyq .gt_center {
  text-align: center;
}

#ehzgbefpyq .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ehzgbefpyq .gt_font_normal {
  font-weight: normal;
}

#ehzgbefpyq .gt_font_bold {
  font-weight: bold;
}

#ehzgbefpyq .gt_font_italic {
  font-style: italic;
}

#ehzgbefpyq .gt_super {
  font-size: 65%;
}

#ehzgbefpyq .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="ehzgbefpyq" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193816</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168235</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215196</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170157</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96076</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9230</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

<style>
.panel1-tab-options-non_seq {
  color: black;
  width: 44.1%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel2-tab-options-non_seq {
  color: black;
  width: 53.9%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel3-tab-options-non_seq {
  color: black;
  width: NA%;
  hight: 33%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
</style>



<!-- 
#=========================================
# Formatting
#=========================================
-->
  
---

class: inverse, center, middle
name: dif-geoms

# Formatting 

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=1000px></html>

---

# Formatting 

.panelset[ 

.panel[.panel-name[Instruction]

.left-full[

Columns of data can be formatted with the `fmt_*()` functions. Here are some of those functions (see [here](https://gt.rstudio.com/reference/index.html) for the complete list). 

+ `fmt_number()`: Format numeric values
+ `fmt_percent()`: Format values as a percentage
+ `fmt_currency()`: Format values as currencies
+ `fmt_date()`: Format values as dates
+ `fmt_markdown()`: Format Markdown text
+ `fmt_missing()`: Format missing values
+ `text_transform()`: Perform targeted text transformation with a function

<br>

Using these function, you can do things like

+ change the the number of decimal points
+ add currency marks in front of numbers
+ parse markdown texts 
+ transform missing values (NA) to the text of your choice
 
]

  ]

<!-- panel ends here -->

.panel[.panel-name[How]

.left-full[

`fmt_*` functions work just like `tab_style`.

+ specify **actions** 
+ specify **locations** using `columns =` and `rows =`

**Example**


```r
fmt_currency(
  columns = vars(y_2005),
  currency = "USD"
) 
```

This will add `$` (action) in front of the numbers in the cells in `y_2005` column.

]

  ]

<!-- panel ends here -->

]

<!-- panel set ends here -->


---



count: false
 
# Demonstrations: Formatting cell values
.panel1-format-user[

```r
*gt_4 <- gt_3

gt_4
```
]
 
.panel2-format-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#dwrdendvqv .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#dwrdendvqv .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#dwrdendvqv .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#dwrdendvqv .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#dwrdendvqv .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#dwrdendvqv .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#dwrdendvqv .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#dwrdendvqv .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#dwrdendvqv .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#dwrdendvqv .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#dwrdendvqv .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#dwrdendvqv .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#dwrdendvqv .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#dwrdendvqv .gt_from_md > :first-child {
  margin-top: 0;
}

#dwrdendvqv .gt_from_md > :last-child {
  margin-bottom: 0;
}

#dwrdendvqv .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#dwrdendvqv .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#dwrdendvqv .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#dwrdendvqv .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#dwrdendvqv .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#dwrdendvqv .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#dwrdendvqv .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#dwrdendvqv .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#dwrdendvqv .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#dwrdendvqv .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#dwrdendvqv .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#dwrdendvqv .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#dwrdendvqv .gt_left {
  text-align: left;
}

#dwrdendvqv .gt_center {
  text-align: center;
}

#dwrdendvqv .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#dwrdendvqv .gt_font_normal {
  font-weight: normal;
}

#dwrdendvqv .gt_font_bold {
  font-weight: bold;
}

#dwrdendvqv .gt_font_italic {
  font-style: italic;
}

#dwrdendvqv .gt_super {
  font-size: 65%;
}

#dwrdendvqv .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="dwrdendvqv" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193816</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168235</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215196</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170157</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96076</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9230</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations: Formatting cell values
.panel1-format-user[

```r
gt_4 <- gt_3 %>%
* fmt_number(
*   columns = vars(y_1995, y_2005),
*   decimals = 1,
*   use_seps = TRUE
* )

gt_4
```
]
 
.panel2-format-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#xsssqsyhmu .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#xsssqsyhmu .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#xsssqsyhmu .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#xsssqsyhmu .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#xsssqsyhmu .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#xsssqsyhmu .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#xsssqsyhmu .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#xsssqsyhmu .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#xsssqsyhmu .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#xsssqsyhmu .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#xsssqsyhmu .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#xsssqsyhmu .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#xsssqsyhmu .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#xsssqsyhmu .gt_from_md > :first-child {
  margin-top: 0;
}

#xsssqsyhmu .gt_from_md > :last-child {
  margin-bottom: 0;
}

#xsssqsyhmu .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#xsssqsyhmu .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#xsssqsyhmu .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#xsssqsyhmu .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#xsssqsyhmu .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#xsssqsyhmu .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#xsssqsyhmu .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#xsssqsyhmu .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#xsssqsyhmu .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#xsssqsyhmu .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#xsssqsyhmu .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#xsssqsyhmu .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#xsssqsyhmu .gt_left {
  text-align: left;
}

#xsssqsyhmu .gt_center {
  text-align: center;
}

#xsssqsyhmu .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#xsssqsyhmu .gt_font_normal {
  font-weight: normal;
}

#xsssqsyhmu .gt_font_bold {
  font-weight: bold;
}

#xsssqsyhmu .gt_font_italic {
  font-style: italic;
}

#xsssqsyhmu .gt_super {
  font-size: 65%;
}

#xsssqsyhmu .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="xsssqsyhmu" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18,072,000.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">20,394,800.0</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3,673,400.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">4,133,900.0</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4,894,276.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">6,314,709.0</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359,225.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">469,885.0</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193,816.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">232,250.0</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168,235.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">209,370.0</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215,196.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">254,886.0</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170,157.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">179,929.0</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96,076.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">101,041.0</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9,230.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">10,027.0</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations: Formatting cell values
.panel1-format-user[

```r
gt_4 <- gt_3 %>%
  fmt_number(
    columns = vars(y_1995, y_2005),
    decimals = 1,
    use_seps = TRUE
  ) %>%
* fmt_percent(
*   columns = vars(pop_ratio_10_15),
*   row = y_1995 >= 300000,
*   decimals = 1,
*   use_seps = TRUE
* )

gt_4
```
]
 
.panel2-format-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#sjhbbrlnid .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#sjhbbrlnid .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#sjhbbrlnid .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#sjhbbrlnid .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#sjhbbrlnid .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#sjhbbrlnid .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#sjhbbrlnid .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#sjhbbrlnid .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#sjhbbrlnid .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#sjhbbrlnid .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#sjhbbrlnid .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#sjhbbrlnid .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#sjhbbrlnid .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#sjhbbrlnid .gt_from_md > :first-child {
  margin-top: 0;
}

#sjhbbrlnid .gt_from_md > :last-child {
  margin-bottom: 0;
}

#sjhbbrlnid .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#sjhbbrlnid .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#sjhbbrlnid .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#sjhbbrlnid .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#sjhbbrlnid .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#sjhbbrlnid .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#sjhbbrlnid .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#sjhbbrlnid .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#sjhbbrlnid .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#sjhbbrlnid .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#sjhbbrlnid .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#sjhbbrlnid .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#sjhbbrlnid .gt_left {
  text-align: left;
}

#sjhbbrlnid .gt_center {
  text-align: center;
}

#sjhbbrlnid .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#sjhbbrlnid .gt_font_normal {
  font-weight: normal;
}

#sjhbbrlnid .gt_font_bold {
  font-weight: bold;
}

#sjhbbrlnid .gt_font_italic {
  font-style: italic;
}

#sjhbbrlnid .gt_super {
  font-size: 65%;
}

#sjhbbrlnid .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="sjhbbrlnid" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18,072,000.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">20,394,800.0</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">116.9&percnt;</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3,673,400.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">4,133,900.0</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">111.2&percnt;</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4,894,276.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">6,314,709.0</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.4&percnt;</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359,225.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">469,885.0</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.0&percnt;</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193,816.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">232,250.0</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168,235.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">209,370.0</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215,196.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">254,886.0</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170,157.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">179,929.0</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96,076.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">101,041.0</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9,230.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">10,027.0</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations: Formatting cell values
.panel1-format-user[

```r
gt_4 <- gt_3 %>%
  fmt_number(
    columns = vars(y_1995, y_2005),
    decimals = 1,
    use_seps = TRUE
  ) %>%
  fmt_percent(
    columns = vars(pop_ratio_10_15),
    row = y_1995 >= 300000,
    decimals = 1,
    use_seps = TRUE
  ) %>%
* fmt_currency(
*   columns = vars(y_2005),
*   currency = "USD"
* )

gt_4
```
]
 
.panel2-format-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ugiokqowsa .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#ugiokqowsa .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ugiokqowsa .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#ugiokqowsa .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#ugiokqowsa .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ugiokqowsa .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ugiokqowsa .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#ugiokqowsa .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#ugiokqowsa .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ugiokqowsa .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ugiokqowsa .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#ugiokqowsa .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#ugiokqowsa .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#ugiokqowsa .gt_from_md > :first-child {
  margin-top: 0;
}

#ugiokqowsa .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ugiokqowsa .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#ugiokqowsa .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#ugiokqowsa .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ugiokqowsa .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#ugiokqowsa .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ugiokqowsa .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ugiokqowsa .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ugiokqowsa .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ugiokqowsa .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ugiokqowsa .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#ugiokqowsa .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ugiokqowsa .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#ugiokqowsa .gt_left {
  text-align: left;
}

#ugiokqowsa .gt_center {
  text-align: center;
}

#ugiokqowsa .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ugiokqowsa .gt_font_normal {
  font-weight: normal;
}

#ugiokqowsa .gt_font_bold {
  font-weight: bold;
}

#ugiokqowsa .gt_font_italic {
  font-style: italic;
}

#ugiokqowsa .gt_super {
  font-size: 65%;
}

#ugiokqowsa .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="ugiokqowsa" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18,072,000.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$20,394,800.00</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">116.9&percnt;</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3,673,400.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$4,133,900.00</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">111.2&percnt;</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4,894,276.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$6,314,709.00</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.4&percnt;</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359,225.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$469,885.00</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.0&percnt;</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193,816.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$232,250.00</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168,235.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$209,370.00</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215,196.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$254,886.00</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170,157.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$179,929.00</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96,076.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$101,041.00</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9,230.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$10,027.00</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations: Formatting cell values
.panel1-format-user[

```r
gt_4 <- gt_3 %>%
  fmt_number(
    columns = vars(y_1995, y_2005),
    decimals = 1,
    use_seps = TRUE
  ) %>%
  fmt_percent(
    columns = vars(pop_ratio_10_15),
    row = y_1995 >= 300000,
    decimals = 1,
    use_seps = TRUE
  ) %>%
  fmt_currency(
    columns = vars(y_2005),
    currency = "USD"
  ) %>%
* fmt_date(
*   columns = "date",
*   date_style = 3
* )

gt_4
```
]
 
.panel2-format-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#wlvudfnxjc .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#wlvudfnxjc .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#wlvudfnxjc .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#wlvudfnxjc .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#wlvudfnxjc .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#wlvudfnxjc .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#wlvudfnxjc .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#wlvudfnxjc .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#wlvudfnxjc .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#wlvudfnxjc .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#wlvudfnxjc .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#wlvudfnxjc .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#wlvudfnxjc .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#wlvudfnxjc .gt_from_md > :first-child {
  margin-top: 0;
}

#wlvudfnxjc .gt_from_md > :last-child {
  margin-bottom: 0;
}

#wlvudfnxjc .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#wlvudfnxjc .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#wlvudfnxjc .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#wlvudfnxjc .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#wlvudfnxjc .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#wlvudfnxjc .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#wlvudfnxjc .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#wlvudfnxjc .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#wlvudfnxjc .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#wlvudfnxjc .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#wlvudfnxjc .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#wlvudfnxjc .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#wlvudfnxjc .gt_left {
  text-align: left;
}

#wlvudfnxjc .gt_center {
  text-align: center;
}

#wlvudfnxjc .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#wlvudfnxjc .gt_font_normal {
  font-weight: normal;
}

#wlvudfnxjc .gt_font_bold {
  font-weight: bold;
}

#wlvudfnxjc .gt_font_italic {
  font-style: italic;
}

#wlvudfnxjc .gt_super {
  font-size: 65%;
}

#wlvudfnxjc .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="wlvudfnxjc" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18,072,000.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$20,394,800.00</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">116.9&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3,673,400.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$4,133,900.00</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">111.2&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4,894,276.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$6,314,709.00</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.4&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359,225.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$469,885.00</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.0&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193,816.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$232,250.00</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168,235.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$209,370.00</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215,196.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$254,886.00</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170,157.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$179,929.00</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96,076.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$101,041.00</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9,230.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$10,027.00</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

<style>
.panel1-format-user {
  color: black;
  width: 39.2%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel2-format-user {
  color: black;
  width: 58.8%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel3-format-user {
  color: black;
  width: NA%;
  hight: 33%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
</style>



<!-- 
#=========================================
# Modify Columns
#=========================================
-->
  
---

class: inverse, center, middle
name: dif-geoms

# Modify Columns 

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=1000px></html>

---
  
# Modify Columns 
 
.panelset[ 

.panel[.panel-name[Instruction]

The cols_*() functions allow for modifications that act on entire columns, instead of working on particular target cells within columns using `tab_style()`.

Here are the list of `cols_*()` functions:

+ `cols_align()`: Set the alignment of columns
+ `cols_width()`: Set the widths of columns
+ `cols_label()`: Relabel one or more columns
+ `cols_move_to_start()`: Move one or more columns to the start
+ `cols_move_to_end()`: Move one or more columns to the end
+ `cols_move()`: Move one or more columns
+ `cols_hide()`: Hide one or more columns
+ `cols_merge_range()`: Merge two columns to a value range column
+ `cols_merge_uncert()`: Merge two columns to a value & uncertainty column
+ `cols_merge()`: Merge data from two or more columns to a single column

  ]

<!-- panel ends here -->

.panel[.panel-name[How]

some

  ]

<!-- panel ends here -->

]

<!-- panel set ends here -->

---




count: false
 
# Demonstrations: Modify column styles
.panel1-columns-format-user[

```r
*gt_5 <- gt_4

gt_5
```
]
 
.panel2-columns-format-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#tavmiavxry .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#tavmiavxry .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#tavmiavxry .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#tavmiavxry .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#tavmiavxry .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tavmiavxry .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#tavmiavxry .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#tavmiavxry .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#tavmiavxry .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#tavmiavxry .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#tavmiavxry .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#tavmiavxry .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#tavmiavxry .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#tavmiavxry .gt_from_md > :first-child {
  margin-top: 0;
}

#tavmiavxry .gt_from_md > :last-child {
  margin-bottom: 0;
}

#tavmiavxry .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#tavmiavxry .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#tavmiavxry .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#tavmiavxry .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#tavmiavxry .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#tavmiavxry .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#tavmiavxry .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#tavmiavxry .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tavmiavxry .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#tavmiavxry .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#tavmiavxry .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#tavmiavxry .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#tavmiavxry .gt_left {
  text-align: left;
}

#tavmiavxry .gt_center {
  text-align: center;
}

#tavmiavxry .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#tavmiavxry .gt_font_normal {
  font-weight: normal;
}

#tavmiavxry .gt_font_bold {
  font-weight: bold;
}

#tavmiavxry .gt_font_italic {
  font-style: italic;
}

#tavmiavxry .gt_super {
  font-size: 65%;
}

#tavmiavxry .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="tavmiavxry" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18,072,000.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$20,394,800.00</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">116.9&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3,673,400.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$4,133,900.00</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">111.2&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4,894,276.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$6,314,709.00</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.4&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359,225.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$469,885.00</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.0&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193,816.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$232,250.00</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168,235.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$209,370.00</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215,196.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$254,886.00</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170,157.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$179,929.00</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96,076.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$101,041.00</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9,230.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$10,027.00</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations: Modify column styles
.panel1-columns-format-user[

```r
gt_5 <- gt_4 %>%
* cols_align(  # this is not reflected
*   align = "left",
*   columns = vars(y_1995)
* )

gt_5
```
]
 
.panel2-columns-format-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ycruwtckqc .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#ycruwtckqc .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ycruwtckqc .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#ycruwtckqc .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#ycruwtckqc .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ycruwtckqc .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ycruwtckqc .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#ycruwtckqc .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#ycruwtckqc .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ycruwtckqc .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ycruwtckqc .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#ycruwtckqc .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#ycruwtckqc .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#ycruwtckqc .gt_from_md > :first-child {
  margin-top: 0;
}

#ycruwtckqc .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ycruwtckqc .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#ycruwtckqc .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#ycruwtckqc .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ycruwtckqc .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#ycruwtckqc .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ycruwtckqc .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ycruwtckqc .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ycruwtckqc .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ycruwtckqc .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ycruwtckqc .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#ycruwtckqc .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ycruwtckqc .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#ycruwtckqc .gt_left {
  text-align: left;
}

#ycruwtckqc .gt_center {
  text-align: center;
}

#ycruwtckqc .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ycruwtckqc .gt_font_normal {
  font-weight: normal;
}

#ycruwtckqc .gt_font_bold {
  font-weight: bold;
}

#ycruwtckqc .gt_font_italic {
  font-style: italic;
}

#ycruwtckqc .gt_super {
  font-size: 65%;
}

#ycruwtckqc .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="ycruwtckqc" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_left">18,072,000.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$20,394,800.00</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">116.9&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_left">3,673,400.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$4,133,900.00</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">111.2&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_left">4,894,276.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$6,314,709.00</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.4&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_left">359,225.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$469,885.00</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.0&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193,816.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$232,250.00</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168,235.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$209,370.00</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215,196.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$254,886.00</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170,157.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$179,929.00</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96,076.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$101,041.00</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9,230.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$10,027.00</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations: Modify column styles
.panel1-columns-format-user[

```r
gt_5 <- gt_4 %>%
  cols_align(  # this is not reflected
    align = "left",
    columns = vars(y_1995)
  ) %>%
* cols_label(
*   "y_1995" = 1995,
*   "pop_ratio_10_15" = md("*Ratio*")
* )

gt_5
```
]
 
.panel2-columns-format-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#orwkfuzfrk .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#orwkfuzfrk .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#orwkfuzfrk .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#orwkfuzfrk .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#orwkfuzfrk .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#orwkfuzfrk .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#orwkfuzfrk .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#orwkfuzfrk .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#orwkfuzfrk .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#orwkfuzfrk .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#orwkfuzfrk .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#orwkfuzfrk .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#orwkfuzfrk .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#orwkfuzfrk .gt_from_md > :first-child {
  margin-top: 0;
}

#orwkfuzfrk .gt_from_md > :last-child {
  margin-bottom: 0;
}

#orwkfuzfrk .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#orwkfuzfrk .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#orwkfuzfrk .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#orwkfuzfrk .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#orwkfuzfrk .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#orwkfuzfrk .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#orwkfuzfrk .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#orwkfuzfrk .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#orwkfuzfrk .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#orwkfuzfrk .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#orwkfuzfrk .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#orwkfuzfrk .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#orwkfuzfrk .gt_left {
  text-align: left;
}

#orwkfuzfrk .gt_center {
  text-align: center;
}

#orwkfuzfrk .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#orwkfuzfrk .gt_font_normal {
  font-weight: normal;
}

#orwkfuzfrk .gt_font_bold {
  font-weight: bold;
}

#orwkfuzfrk .gt_font_italic {
  font-style: italic;
}

#orwkfuzfrk .gt_super {
  font-size: 65%;
}

#orwkfuzfrk .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="orwkfuzfrk" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1"><em>Ratio</em></th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_left">18,072,000.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$20,394,800.00</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">116.9&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_left">3,673,400.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$4,133,900.00</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">111.2&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_left">4,894,276.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$6,314,709.00</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.4&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_left">359,225.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$469,885.00</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.0&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193,816.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$232,250.00</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168,235.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$209,370.00</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215,196.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$254,886.00</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170,157.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$179,929.00</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96,076.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$101,041.00</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9,230.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$10,027.00</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations: Modify column styles
.panel1-columns-format-user[

```r
gt_5 <- gt_4 %>%
  cols_align(  # this is not reflected
    align = "left",
    columns = vars(y_1995)
  ) %>%
  cols_label(
    "y_1995" = 1995,
    "pop_ratio_10_15" = md("*Ratio*")
  ) %>%
* cols_move_to_start(
*   columns = vars(pop_ratio_10_15, date)
* )

gt_5
```
]
 
.panel2-columns-format-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#dpstifpvww .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#dpstifpvww .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#dpstifpvww .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#dpstifpvww .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#dpstifpvww .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#dpstifpvww .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#dpstifpvww .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#dpstifpvww .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#dpstifpvww .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#dpstifpvww .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#dpstifpvww .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#dpstifpvww .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#dpstifpvww .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#dpstifpvww .gt_from_md > :first-child {
  margin-top: 0;
}

#dpstifpvww .gt_from_md > :last-child {
  margin-bottom: 0;
}

#dpstifpvww .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#dpstifpvww .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#dpstifpvww .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#dpstifpvww .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#dpstifpvww .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#dpstifpvww .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#dpstifpvww .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#dpstifpvww .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#dpstifpvww .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#dpstifpvww .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#dpstifpvww .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#dpstifpvww .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#dpstifpvww .gt_left {
  text-align: left;
}

#dpstifpvww .gt_center {
  text-align: center;
}

#dpstifpvww .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#dpstifpvww .gt_font_normal {
  font-weight: normal;
}

#dpstifpvww .gt_font_bold {
  font-weight: bold;
}

#dpstifpvww .gt_font_italic {
  font-style: italic;
}

#dpstifpvww .gt_super {
  font-size: 65%;
}

#dpstifpvww .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="dpstifpvww" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1"><em>Ratio</em></th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_right">116.9&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_left">18,072,000.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$20,394,800.00</td>
      <td class="gt_row gt_center">23850784</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_right">111.2&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_left">3,673,400.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$4,133,900.00</td>
      <td class="gt_row gt_center">4595700</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.4&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_left">4,894,276.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$6,314,709.00</td>
      <td class="gt_row gt_center">7919825</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.0&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_left">359,225.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$469,885.00</td>
      <td class="gt_row gt_center">587482</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193,816.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$232,250.00</td>
      <td class="gt_row gt_center">272400</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168,235.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$209,370.00</td>
      <td class="gt_row gt_center">264603</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215,196.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$254,886.00</td>
      <td class="gt_row gt_center">277690</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170,157.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$179,929.00</td>
      <td class="gt_row gt_center">193759</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96,076.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$101,041.00</td>
      <td class="gt_row gt_center">106364</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9,230.0</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$10,027.00</td>
      <td class="gt_row gt_center">11001</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations: Modify column styles
.panel1-columns-format-user[

```r
gt_5 <- gt_4 %>%
  cols_align(  # this is not reflected
    align = "left",
    columns = vars(y_1995)
  ) %>%
  cols_label(
    "y_1995" = 1995,
    "pop_ratio_10_15" = md("*Ratio*")
  ) %>%
  cols_move_to_start(
    columns = vars(pop_ratio_10_15, date)
  ) %>%
* cols_move(
*   columns = vars(y_2005),
*   after = vars(date)
* )

gt_5
```
]
 
.panel2-columns-format-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#dtyjllpozn .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#dtyjllpozn .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#dtyjllpozn .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#dtyjllpozn .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#dtyjllpozn .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#dtyjllpozn .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#dtyjllpozn .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#dtyjllpozn .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#dtyjllpozn .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#dtyjllpozn .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#dtyjllpozn .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#dtyjllpozn .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#dtyjllpozn .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#dtyjllpozn .gt_from_md > :first-child {
  margin-top: 0;
}

#dtyjllpozn .gt_from_md > :last-child {
  margin-bottom: 0;
}

#dtyjllpozn .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#dtyjllpozn .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#dtyjllpozn .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#dtyjllpozn .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#dtyjllpozn .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#dtyjllpozn .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#dtyjllpozn .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#dtyjllpozn .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#dtyjllpozn .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#dtyjllpozn .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#dtyjllpozn .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#dtyjllpozn .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#dtyjllpozn .gt_left {
  text-align: left;
}

#dtyjllpozn .gt_center {
  text-align: center;
}

#dtyjllpozn .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#dtyjllpozn .gt_font_normal {
  font-weight: normal;
}

#dtyjllpozn .gt_font_bold {
  font-weight: bold;
}

#dtyjllpozn .gt_font_italic {
  font-style: italic;
}

#dtyjllpozn .gt_super {
  font-size: 65%;
}

#dtyjllpozn .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="dtyjllpozn" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1"><em>Ratio</em></th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1">
        <span class="gt_column_spanner">2000s</span>
      </th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_right">116.9&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$20,394,800.00</td>
      <td class="gt_row gt_left">18,072,000.0</td>
      <td class="gt_row gt_center">23850784</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_right">111.2&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$4,133,900.00</td>
      <td class="gt_row gt_left">3,673,400.0</td>
      <td class="gt_row gt_center">4595700</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.4&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$6,314,709.00</td>
      <td class="gt_row gt_left">4,894,276.0</td>
      <td class="gt_row gt_center">7919825</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.0&percnt;</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$469,885.00</td>
      <td class="gt_row gt_left">359,225.0</td>
      <td class="gt_row gt_center">587482</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$232,250.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193,816.0</td>
      <td class="gt_row gt_center">272400</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$209,370.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168,235.0</td>
      <td class="gt_row gt_center">264603</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$254,886.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215,196.0</td>
      <td class="gt_row gt_center">277690</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$179,929.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170,157.0</td>
      <td class="gt_row gt_center">193759</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$101,041.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96,076.0</td>
      <td class="gt_row gt_center">106364</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">Thu, Nov 14, 2013</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$10,027.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9,230.0</td>
      <td class="gt_row gt_center">11001</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations: Modify column styles
.panel1-columns-format-user[

```r
gt_5 <- gt_4 %>%
  cols_align(  # this is not reflected
    align = "left",
    columns = vars(y_1995)
  ) %>%
  cols_label(
    "y_1995" = 1995,
    "pop_ratio_10_15" = md("*Ratio*")
  ) %>%
  cols_move_to_start(
    columns = vars(pop_ratio_10_15, date)
  ) %>%
  cols_move(
    columns = vars(y_2005),
    after = vars(date)
  ) %>%
* cols_hide(
*   columns = vars(date)
* )

gt_5
```
]
 
.panel2-columns-format-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#gymyfbnfqt .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#gymyfbnfqt .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#gymyfbnfqt .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#gymyfbnfqt .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#gymyfbnfqt .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#gymyfbnfqt .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#gymyfbnfqt .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#gymyfbnfqt .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#gymyfbnfqt .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#gymyfbnfqt .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#gymyfbnfqt .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#gymyfbnfqt .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#gymyfbnfqt .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#gymyfbnfqt .gt_from_md > :first-child {
  margin-top: 0;
}

#gymyfbnfqt .gt_from_md > :last-child {
  margin-bottom: 0;
}

#gymyfbnfqt .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#gymyfbnfqt .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#gymyfbnfqt .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#gymyfbnfqt .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#gymyfbnfqt .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#gymyfbnfqt .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#gymyfbnfqt .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#gymyfbnfqt .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#gymyfbnfqt .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#gymyfbnfqt .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#gymyfbnfqt .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#gymyfbnfqt .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#gymyfbnfqt .gt_left {
  text-align: left;
}

#gymyfbnfqt .gt_center {
  text-align: center;
}

#gymyfbnfqt .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#gymyfbnfqt .gt_font_normal {
  font-weight: normal;
}

#gymyfbnfqt .gt_font_bold {
  font-weight: bold;
}

#gymyfbnfqt .gt_font_italic {
  font-style: italic;
}

#gymyfbnfqt .gt_super {
  font-size: 65%;
}

#gymyfbnfqt .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="gymyfbnfqt" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="5" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="5" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1"><em>Ratio</em></th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1">
        <span class="gt_column_spanner">2000s</span>
      </th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="5" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_right">116.9&percnt;</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$20,394,800.00</td>
      <td class="gt_row gt_left">18,072,000.0</td>
      <td class="gt_row gt_center">23850784</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_right">111.2&percnt;</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$4,133,900.00</td>
      <td class="gt_row gt_left">3,673,400.0</td>
      <td class="gt_row gt_center">4595700</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="5" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.4&percnt;</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$6,314,709.00</td>
      <td class="gt_row gt_left">4,894,276.0</td>
      <td class="gt_row gt_center">7919825</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">125.0&percnt;</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$469,885.00</td>
      <td class="gt_row gt_left">359,225.0</td>
      <td class="gt_row gt_center">587482</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$232,250.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193,816.0</td>
      <td class="gt_row gt_center">272400</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_right" style="background-color: #FF0000;">1.263806</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$209,370.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168,235.0</td>
      <td class="gt_row gt_center">264603</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="5" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$254,886.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215,196.0</td>
      <td class="gt_row gt_center">277690</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$179,929.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170,157.0</td>
      <td class="gt_row gt_center">193759</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$101,041.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96,076.0</td>
      <td class="gt_row gt_center">106364</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$10,027.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9,230.0</td>
      <td class="gt_row gt_center">11001</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="5">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="5">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations: Modify column styles
.panel1-columns-format-user[

```r
gt_5 <- gt_4 %>%
  cols_align(  # this is not reflected
    align = "left",
    columns = vars(y_1995)
  ) %>%
  cols_label(
    "y_1995" = 1995,
    "pop_ratio_10_15" = md("*Ratio*")
  ) %>%
  cols_move_to_start(
    columns = vars(pop_ratio_10_15, date)
  ) %>%
  cols_move(
    columns = vars(y_2005),
    after = vars(date)
  ) %>%
  cols_hide(
    columns = vars(date)
  ) %>%
* cols_merge(
*   columns = vars(y_1995, pop_ratio_10_15),
*   hide_columns = vars(pop_ratio_10_15),
*   pattern = "{1}/{2}"
* )

gt_5
```
]
 
.panel2-columns-format-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#rhuxotovhv .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#rhuxotovhv .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#rhuxotovhv .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#rhuxotovhv .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#rhuxotovhv .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rhuxotovhv .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#rhuxotovhv .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#rhuxotovhv .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#rhuxotovhv .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#rhuxotovhv .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#rhuxotovhv .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#rhuxotovhv .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#rhuxotovhv .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#rhuxotovhv .gt_from_md > :first-child {
  margin-top: 0;
}

#rhuxotovhv .gt_from_md > :last-child {
  margin-bottom: 0;
}

#rhuxotovhv .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#rhuxotovhv .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#rhuxotovhv .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rhuxotovhv .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#rhuxotovhv .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rhuxotovhv .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#rhuxotovhv .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#rhuxotovhv .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rhuxotovhv .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#rhuxotovhv .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#rhuxotovhv .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#rhuxotovhv .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#rhuxotovhv .gt_left {
  text-align: left;
}

#rhuxotovhv .gt_center {
  text-align: center;
}

#rhuxotovhv .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#rhuxotovhv .gt_font_normal {
  font-weight: normal;
}

#rhuxotovhv .gt_font_bold {
  font-weight: bold;
}

#rhuxotovhv .gt_font_italic {
  font-style: italic;
}

#rhuxotovhv .gt_super {
  font-size: 65%;
}

#rhuxotovhv .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="rhuxotovhv" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="4" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="4" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1">
        <span class="gt_column_spanner">2000s</span>
      </th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$20,394,800.00</td>
      <td class="gt_row gt_left">18,072,000.0/116.9&percnt;</td>
      <td class="gt_row gt_center">23850784</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$4,133,900.00</td>
      <td class="gt_row gt_left">3,673,400.0/111.2&percnt;</td>
      <td class="gt_row gt_center">4595700</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$6,314,709.00</td>
      <td class="gt_row gt_left">4,894,276.0/125.4&percnt;</td>
      <td class="gt_row gt_center">7919825</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$469,885.00</td>
      <td class="gt_row gt_left">359,225.0/125.0&percnt;</td>
      <td class="gt_row gt_center">587482</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$232,250.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193,816.0/1.172874</td>
      <td class="gt_row gt_center">272400</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$209,370.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168,235.0/1.263806</td>
      <td class="gt_row gt_center">264603</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$254,886.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215,196.0/1.089467</td>
      <td class="gt_row gt_center">277690</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$179,929.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170,157.0/1.076864</td>
      <td class="gt_row gt_center">193759</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$101,041.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96,076.0/1.052682</td>
      <td class="gt_row gt_center">106364</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$10,027.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9,230.0/1.097138</td>
      <td class="gt_row gt_center">11001</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="4">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="4">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstrations: Modify column styles
.panel1-columns-format-user[

```r
gt_5 <- gt_4 %>%
  cols_align(  # this is not reflected
    align = "left",
    columns = vars(y_1995)
  ) %>%
  cols_label(
    "y_1995" = 1995,
    "pop_ratio_10_15" = md("*Ratio*")
  ) %>%
  cols_move_to_start(
    columns = vars(pop_ratio_10_15, date)
  ) %>%
  cols_move(
    columns = vars(y_2005),
    after = vars(date)
  ) %>%
  cols_hide(
    columns = vars(date)
  ) %>%
  cols_merge(
    columns = vars(y_1995, pop_ratio_10_15),
    hide_columns = vars(pop_ratio_10_15),
    pattern = "{1}/{2}"
  ) %>%
* cols_width(
*   vars(y_1995) ~ px(400)
* )

gt_5
```
]
 
.panel2-columns-format-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#hqclnpuyhz .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: lightcyan;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 5px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#hqclnpuyhz .gt_heading {
  background-color: lightcyan;
  text-align: center;
  border-bottom-color: lightcyan;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hqclnpuyhz .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: lightcyan;
  border-bottom-width: 0;
}

#hqclnpuyhz .gt_subtitle {
  color: #333333;
  font-size: 20px;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: lightcyan;
  border-top-width: 0;
}

#hqclnpuyhz .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hqclnpuyhz .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hqclnpuyhz .gt_col_heading {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#hqclnpuyhz .gt_column_spanner_outer {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#hqclnpuyhz .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#hqclnpuyhz .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#hqclnpuyhz .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#hqclnpuyhz .gt_group_heading {
  padding: 8px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#hqclnpuyhz .gt_empty_group_heading {
  padding: 0.5px;
  color: #FFFFFF;
  background-color: #8B008B;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#hqclnpuyhz .gt_from_md > :first-child {
  margin-top: 0;
}

#hqclnpuyhz .gt_from_md > :last-child {
  margin-bottom: 0;
}

#hqclnpuyhz .gt_row {
  padding-top: 5px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#hqclnpuyhz .gt_stub {
  color: #333333;
  background-color: lightcyan;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#hqclnpuyhz .gt_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hqclnpuyhz .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#hqclnpuyhz .gt_grand_summary_row {
  color: #333333;
  background-color: lightcyan;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hqclnpuyhz .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#hqclnpuyhz .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#hqclnpuyhz .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: green;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hqclnpuyhz .gt_footnotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hqclnpuyhz .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#hqclnpuyhz .gt_sourcenotes {
  color: #333333;
  background-color: lightcyan;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #B2B2FF;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hqclnpuyhz .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#hqclnpuyhz .gt_left {
  text-align: left;
}

#hqclnpuyhz .gt_center {
  text-align: center;
}

#hqclnpuyhz .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#hqclnpuyhz .gt_font_normal {
  font-weight: normal;
}

#hqclnpuyhz .gt_font_bold {
  font-weight: bold;
}

#hqclnpuyhz .gt_font_italic {
  font-style: italic;
}

#hqclnpuyhz .gt_super {
  font-size: 65%;
}

#hqclnpuyhz .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="hqclnpuyhz" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table" style="table-layout: fixed;">
  <colgroup>
    <col/>
    <col/>
    <col style="width:400px;"/>
    <col/>
  </colgroup>
  <thead class="gt_header">
    <tr>
      <th colspan="4" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="4" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="1">
        <span class="gt_column_spanner">2000s</span>
      </th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">a</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$20,394,800.00</td>
      <td class="gt_row gt_left">18,072,000.0/116.9&percnt;</td>
      <td class="gt_row gt_center">23850784</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$4,133,900.00</td>
      <td class="gt_row gt_left">3,673,400.0/111.2&percnt;</td>
      <td class="gt_row gt_center">4595700</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$6,314,709.00</td>
      <td class="gt_row gt_left">4,894,276.0/125.4&percnt;</td>
      <td class="gt_row gt_center">7919825</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$469,885.00</td>
      <td class="gt_row gt_left">359,225.0/125.0&percnt;</td>
      <td class="gt_row gt_center">587482</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$232,250.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">193,816.0/1.172874</td>
      <td class="gt_row gt_center">272400</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$209,370.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">168,235.0/1.263806</td>
      <td class="gt_row gt_center">264603</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="4" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$254,886.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">215,196.0/1.089467</td>
      <td class="gt_row gt_center">277690</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$179,929.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">170,157.0/1.076864</td>
      <td class="gt_row gt_center">193759</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$101,041.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">96,076.0/1.052682</td>
      <td class="gt_row gt_center">106364</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center" style="font-size: 10px; text-align: right; vertical-align: top; text-decoration: underline;">$10,027.00</td>
      <td class="gt_row gt_left" style="border-top-width: 1px; border-top-style: dotted; border-top-color: #000000; color: #E50000; font-style: italic; font-weight: bold;">9,230.0/1.097138</td>
      <td class="gt_row gt_center">11001</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="4">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="4">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>a</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

<style>
.panel1-columns-format-user {
  color: black;
  width: 39.2%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel2-columns-format-user {
  color: black;
  width: 58.8%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel3-columns-format-user {
  color: black;
  width: NA%;
  hight: 33%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
</style>



---


# Placing figures in table cells 

.panelset[ 

.panel[.panel-name[Instruction]

You can put figures in table cells instead of texts using `text_transform()` in conjunction with `*_image()` functions:

+ `web_image()`: Helper function for adding an image from the web
+ `local_image()`: Helper function for adding a local image
+ `ggplot_image()`: Helper function for adding a ggplot

Inside `text_transform()`, you 

+ specify the figure you add using one of the `*_image()` functions 
+ specify the location of the figure using `cells_*()` with `columns =` and `rows =` options 

  ]

<!-- panel ends here -->

.panel[.panel-name[How]

**Syntax**


```r
text_transform(
  locations = cells_*(),
  fn = function(x) {
    *_image()
  }
) 
```

**Example**

The following code will place `g_ex` (a ggplot object) of 50 px height in the cell located at [3, y_1995] of the table cell body.


```r
text_transform(
  locations = cells_body(
*   columns = vars(y_1995),
*   rows = 3
  ),
  fn = function(x) {
*   ggplot_image(g_ex, height = px(50))
  } 
)  
```

  ]

<!-- panel ends here -->

]

<!-- panel set ends here -->



---



count: false
 
# Demonstration: Adding figures
.panel1-ggplot-added-flip-user[

```r
*gt_1
```
]
 
.panel2-ggplot-added-flip-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#knojdrobuk .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#knojdrobuk .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#knojdrobuk .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#knojdrobuk .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#knojdrobuk .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#knojdrobuk .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#knojdrobuk .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#knojdrobuk .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#knojdrobuk .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#knojdrobuk .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#knojdrobuk .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#knojdrobuk .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#knojdrobuk .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#knojdrobuk .gt_from_md > :first-child {
  margin-top: 0;
}

#knojdrobuk .gt_from_md > :last-child {
  margin-bottom: 0;
}

#knojdrobuk .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#knojdrobuk .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#knojdrobuk .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#knojdrobuk .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#knojdrobuk .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#knojdrobuk .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#knojdrobuk .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#knojdrobuk .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#knojdrobuk .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#knojdrobuk .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#knojdrobuk .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#knojdrobuk .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#knojdrobuk .gt_left {
  text-align: left;
}

#knojdrobuk .gt_center {
  text-align: center;
}

#knojdrobuk .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#knojdrobuk .gt_font_normal {
  font-weight: normal;
}

#knojdrobuk .gt_font_bold {
  font-weight: bold;
}

#knojdrobuk .gt_font_italic {
  font-style: italic;
}

#knojdrobuk .gt_super {
  font-size: 65%;
}

#knojdrobuk .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="knojdrobuk" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center">4894276</td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center">168235</td>
      <td class="gt_row gt_center">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center">215196</td>
      <td class="gt_row gt_center">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center">170157</td>
      <td class="gt_row gt_center">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center">96076</td>
      <td class="gt_row gt_center">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center">9230</td>
      <td class="gt_row gt_center">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstration: Adding figures
.panel1-ggplot-added-flip-user[

```r
gt_1 %>%
* text_transform(
*   locations = cells_body(
*     columns = vars(y_1995),
*     rows = 3
*   ),
*   fn = function(x) {
*     ggplot_image(g_ex, height = px(50))
*   }
* )
```
]
 
.panel2-ggplot-added-flip-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#muimjjpsvu .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#muimjjpsvu .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#muimjjpsvu .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#muimjjpsvu .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#muimjjpsvu .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#muimjjpsvu .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#muimjjpsvu .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#muimjjpsvu .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#muimjjpsvu .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#muimjjpsvu .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#muimjjpsvu .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#muimjjpsvu .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#muimjjpsvu .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#muimjjpsvu .gt_from_md > :first-child {
  margin-top: 0;
}

#muimjjpsvu .gt_from_md > :last-child {
  margin-bottom: 0;
}

#muimjjpsvu .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#muimjjpsvu .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#muimjjpsvu .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#muimjjpsvu .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#muimjjpsvu .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#muimjjpsvu .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#muimjjpsvu .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#muimjjpsvu .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#muimjjpsvu .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#muimjjpsvu .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#muimjjpsvu .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#muimjjpsvu .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#muimjjpsvu .gt_left {
  text-align: left;
}

#muimjjpsvu .gt_center {
  text-align: center;
}

#muimjjpsvu .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#muimjjpsvu .gt_font_normal {
  font-weight: normal;
}

#muimjjpsvu .gt_font_bold {
  font-weight: bold;
}

#muimjjpsvu .gt_font_italic {
  font-style: italic;
}

#muimjjpsvu .gt_super {
  font-size: 65%;
}

#muimjjpsvu .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="muimjjpsvu" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center"><img cid="nwtqsmfrobcy__temp_ggplot.png" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfQAAAH0CAYAAADL1t+KAAAEGWlDQ1BrQ0dDb2xvclNwYWNlR2VuZXJpY1JHQgAAOI2NVV1oHFUUPrtzZyMkzlNsNIV0qD8NJQ2TVjShtLp/3d02bpZJNtoi6GT27s6Yyc44M7v9oU9FUHwx6psUxL+3gCAo9Q/bPrQvlQol2tQgKD60+INQ6Ium65k7M5lpurHeZe58853vnnvuuWfvBei5qliWkRQBFpquLRcy4nOHj4g9K5CEh6AXBqFXUR0rXalMAjZPC3e1W99Dwntf2dXd/p+tt0YdFSBxH2Kz5qgLiI8B8KdVy3YBevqRHz/qWh72Yui3MUDEL3q44WPXw3M+fo1pZuQs4tOIBVVTaoiXEI/MxfhGDPsxsNZfoE1q66ro5aJim3XdoLFw72H+n23BaIXzbcOnz5mfPoTvYVz7KzUl5+FRxEuqkp9G/Ajia219thzg25abkRE/BpDc3pqvphHvRFys2weqvp+krbWKIX7nhDbzLOItiM8358pTwdirqpPFnMF2xLc1WvLyOwTAibpbmvHHcvttU57y5+XqNZrLe3lE/Pq8eUj2fXKfOe3pfOjzhJYtB/yll5SDFcSDiH+hRkH25+L+sdxKEAMZahrlSX8ukqMOWy/jXW2m6M9LDBc31B9LFuv6gVKg/0Szi3KAr1kGq1GMjU/aLbnq6/lRxc4XfJ98hTargX++DbMJBSiYMIe9Ck1YAxFkKEAG3xbYaKmDDgYyFK0UGYpfoWYXG+fAPPI6tJnNwb7ClP7IyF+D+bjOtCpkhz6CFrIa/I6sFtNl8auFXGMTP34sNwI/JhkgEtmDz14ySfaRcTIBInmKPE32kxyyE2Tv+thKbEVePDfW/byMM1Kmm0XdObS7oGD/MypMXFPXrCwOtoYjyyn7BV29/MZfsVzpLDdRtuIZnbpXzvlf+ev8MvYr/Gqk4H/kV/G3csdazLuyTMPsbFhzd1UabQbjFvDRmcWJxR3zcfHkVw9GfpbJmeev9F08WW8uDkaslwX6avlWGU6NRKz0g/SHtCy9J30o/ca9zX3Kfc19zn3BXQKRO8ud477hLnAfc1/G9mrzGlrfexZ5GLdn6ZZrrEohI2wVHhZywjbhUWEy8icMCGNCUdiBlq3r+xafL549HQ5jH+an+1y+LlYBifuxAvRN/lVVVOlwlCkdVm9NOL5BE4wkQ2SMlDZU97hX86EilU/lUmkQUztTE6mx1EEPh7OmdqBtAvv8HdWpbrJS6tJj3n0CWdM6busNzRV3S9KTYhqvNiqWmuroiKgYhshMjmhTh9ptWhsF7970j/SbMrsPE1suR5z7DMC+P/Hs+y7ijrQAlhyAgccjbhjPygfeBTjzhNqy28EdkUh8C+DU9+z2v/oyeH791OncxHOs5y2AtTc7nb/f73TWPkD/qwBnjX8BoJ98VQNcC+8AAEAASURBVHgB7Z0HnFTV2f+fmdnZ3pcOAhGsGBT1VbHxYkssMWJiAxILsb8WDGqir1EjtmiMYotGjK+oELH3+A8WVLCLFRVREQGBZYHtdeZ/nrvOsmVmdnZ3yr13vufz2Z2595577nm+z73zu6d7giYIAQIQgAAEIAABRxPwOjr3ZB4CEIAABCAAAYsAgs6NAAEIQAACEHABAQTdBU7EBAhAAAIQgACCzj0AAQhAAAIQcAEBBN0FTsQECEAAAhCAAILOPQABCEAAAhBwAQEE3QVOxAQIQAACEIBAhhsRrFmzxjFmlZaWSkVFhWPy25uMZmVlidq5fv16aW5u7k0SjjknHfyZl5cnhYWF4qTnrDc3UEZGhuTm5kplZWVvTnfMOUVFRZKZmWk9n47JdC8ymp2dLV6vV2pra3txtj1OGTx4cNSMUEKPioeDEIAABCAAAWcQQNCd4SdyCQEIQAACEIhKAEGPioeDEIAABCAAAWcQQNCd4SdyCQEIQAACEIhKAEGPioeDEIAABCAAAWcQQNCd4SdyCQEIQAACEIhKAEGPioeDEIAABCAAAWcQQNCd4SdyCQEIQAACEIhKAEGPioeDEIAABCAAAWcQcOVMcc5ATy4hAAEIQMBNBNav98qLL2bJU0/lmJkUfbJpk0fKygLyk580y6RJ9XLggQ1m9sFgwkxG0BOGloQhAAEIQCAdCNTWeuT66/PlgQdyxeMRM73slsrv8nKffPGFX15/PctMPStyzjnVcuaZNdb3eLNB0ONNlPQgAAEIQCBtCJSXe+UXvyiTtWu9Ul+/Rcg7A6iubj32t7/ly7/+lSOvvlpuiX/neH3Zjnz1vqTKuRCAAAQgAAGXE6iq8sjYsQNl5UpfVDFvj0FL799+myEHH9xPmpraH+n7dwS97wxJAQIQgAAE0oyALhx59NFl4vMFJRAw9ew9CM3NHvnmG59cfXVBD87qPiqC3j0jYkAAAhCAAAQ6EHjuuWxT0vZJS0vPxDyUSF2dV+bMyTXt6/Fr+UbQQ3T5hAAEIAABCMRI4LrrCqSmpm8SWl/vkRtvzI/xit1H61tuuk+fGBCAAAQgAAFXEVi92msNS+urUcGgx3SOyzJV9n1NqfV8BD0+HEkFAhCAAATShMCSJX7JzIzPeHId5rZihS8u5BD0uGAkEQhAAAIQSBcCa9f6pLGxd23nnRnp2HRNLx4BQY8HRdKAAAQgAIG0IaCl6viG+JT2EfT4eoXUIAABCEDA5QQGDAjErco9aLRc04tHQNDjQZE0IAABCEAgbQjsvHOjmRQmPsX0lhaRkSPNvzgEBD0OEEkCAhCAAATSh8CQIQEZNKjvIuzxBGX//RviNq87gp4+9yCWQgACEIBAHAhoG/rFF1dJXl7fqsqzs4Ny0UXVcchRaxIIetxQkhAEIAABCKQLgcMPr5cRI1okI6N3Hdr0vJ//vEG2287MIRungKDHCSTJQAACEIBA+hDIMDO2zp1bIVlZQbNqWs9E3e8PWp3qZs3aFFdgCHpccZIYBCAAAQikC4H+/QPy4YfrRKvOs7Jiq37Xavpdd22UTz9daxZ2iS8pBD2+PEkNAhCAAATSiEBublA++midTJ1aJzk5AesvnPn5+QEpKAjIOedUy6OPask+XKy+7YvfMi99ywdnQwACEIhIQNeNrqnxSGFhMG49giNejAMQ6CGBvLygXHVVpSXWL76YJU89lSOrV/ukstIjpaUBa1japEl1ctBBDaYjXc+q53uSFQS9J7SICwEIJJWACvkZZxTLyy9nW9fVMbvPPFMuP/1p/DoSJdUgLuZqAjpBjJbU9S8VgSr3VFDnmhCAQLcEdAatHXccKP/+d7boMpP6p5N5/Oxn/WXx4sxuzycCBNKNAIKebh7HXgg4hMCiRZlSW+sxS0t2nZHrqqsKHGIF2YRA8gi4ssq9tLQ0eQT7eCW/32/aWJyT396Y69XlhEwoKiqSoBa7XBzSwZ++H7vmJvq+XbfOK7m52nbe9YZZuTLxz43HzB6i926i7exqXXL3ZJjxV2qr2+0M/Q5lZ7c23ySXcnKu5kpBr6ioSA69OFxFHyIn5bc3JmeZ7pxq5+bNm6W52d1tn+ngz7y8PNM5rTDh921eXpYZ1lNsbrmuJfSSkuaEX1+FLte8UVRWVvbmtnfMOfqinZmZmXCeqQaiQq6iXltbm+qs9Pr6gwcPjnouVe5R8XAQAhBIFYEJExrMi2Ag7KQdV1xRlapscV0I2JYAgm5b15AxCKQ3AR2n+9JL600zjceaVauoKGDNnX3ddZvkgAMa0hsO1kMgDAFXVrmHsZNdEICAAwloc+fKlWtk1SqfqRL2yrbbNptqcHf3w3Cgm8iyTQgg6DZxBNmAAATCE9A+eMOHt1h/4WOwFwIQUAJUuXMfQAACEIAABFxAAEF3gRMxAQIQgAAEIICgcw9AAAIQgAAEXEAAQXeBEzEBAhCAAAQggKBzD0AAAhCAAARcQABBd4ETMQECEIAABCCAoHMPQAACEIAABFxAAEF3gRMxAQIQgAAEIICgcw9AAAIQgAAEXEAAQXeBEzEBAhCAAAQggKBzD0AAAhCAAARcQABBd4ETMQECEIAABCCAoHMPQAACEIAABFxAAEF3gRMxAQIQgAAEIICgcw9AAAIQgAAEXEAAQXeBEzEBAhCAAAQggKBzD0AAAhCAAARcQABBd4ETMQECEIAABCCAoHMPQAACEIAABFxAAEF3gRMxAQIQgAAEIICgcw9AAAIQgAAEXEAAQXeBEzEBAhCAAAQggKBzD0AAAhCAAARcQABBd4ETMQECEIAABCCAoHMPQAACEIAABFxAAEF3gRMxAQIQgAAEIICgcw9AAAIQgAAEXEAAQXeBEzEBAhCAAAQggKBzD0AAAhCAAARcQABBd4ETMQECEIAABCCAoHMPQAACEIAABFxAAEF3gRMxAQIQgAAEIICgcw9AAAIQgAAEXEAAQXeBEzEBAhCAAAQggKBzD0AAAhCAAARcQABBd4ETMQECEIAABCCAoHMPQAACEIAABFxAAEF3gRMxAQIQgAAEIICgcw9AAAIQgAAEXEAgI5k2vPjii7JgwQLp37+/HHHEEbL99tu3Xf7pp5+W119/Xfr16ycnn3yy9akHKyoq5PHHH5elS5fKuHHj5IQTThCvl/eQNnB8gYALCfznP1ly7725Ul7ulZ13bpKLLqo2vxsBF1qKSRCIH4GkKeOzzz4r999/v/z2t7+VMWPGyMUXXyy1tbWWJSrm+nfccceJ3++X888/XwKB1od35syZsnnzZpk8ebIsXLhQZs+eHT/rSQkCELAdgQcfzDG/E6XyyivZ8sknmTJvXq4R9YGyfLnPdnklQxCwE4GkCfqcOXPkD3/4gyXmhx56qJxzzjmyadMmi4UeO++882TXXXe1xNzn88m7774rn3/+uaxYsUKmT59uHbv00kut0npLS4udGJIXCEAgTgRUtC+8sLhDai0tHrMdNC/1pcKj3wENGxDoQCApVe41NTWyZs0ayc7OlltvvdWqTtcq94KCAmlubpa1a9fK6NGj2zI2atQoS8hLS0ut/R6PPtAiw4cPl7q6Otm4cWNblbzuP+mkk/TDCiNGjJBLLrkktGn7T62RUDvdHEJNJEVFRRIMBt1sqlXD5HZ/6gu3hkTY+eSTXsnPD0p1deszv+Vm8ciGDT7T3FZqrrtlbyK/6e+O2pqRkZSfyUSaEjVttU9tTYQ/o144yQf1d0jtVB1ya0hKCX39+vXWD90NN9wgw4YNk9WrV1tV6I2NjaaNrNx6YLKystoY5+fnW6V3FXoV/fYhdKz9Pi2xt/9rf4zvEICAcwj8+O7unAyTUwjYiEBSXj31DbChoUGmTZsme+yxh2X+smXLZNGiRVZHt6amJqvNPFSS07hDhw4VFXn93j7otpb02getsm8ftDbAKUHfirXjn5uD+lHt1L4QWiPj5pAO/szLy5PCwsKE3Ldjxvikqal/2FvEvP+bGp4Kc92wh+O+U3+3cnNzpbKyMu5p2ylB/T3NzMxMiD/tZKeWzFVjQn237JS3WPMyePDgqFGTUkLXXu0aRo4caX3qPy2pa/u43kxa7awl9VDQEr1mXM/T76FQXV1tCUJZWVloF58QgICLCIwa1SJ//vPmDhZ5va3NNO+8s878IHc4xAYEINCOQFIeDy2h7bfffvLkk09al9YS6eLFi62Obrpj4sSJ8vDDD1vV5jo8bfny5TJ27FjZbbfdZNWqVbJkyRKrBD9v3jzZe++9GbbWzoF8hYDbCPzmN3Xyz39WyP77N8iOOzbJMcfUmdq8dTJwIMPW3OZr7IkvAY/ppJSUXkraHn755ZdLVVWVVYV1/PHHy5QpUyxr9JgOY9Nj2mlBe8BPmDDBOvbqq6/KNddcY1XxaXXm1Vdf3aFDXDgcVLmHo5K6faEqd61toco9dX6I15VDVe6xPmcvv5wpd9+dJx995JfGRo8MGdJi5pOoNfNN1JpmtXjlKv7ppFuVe/va0PjTTH2K6VDlnjRBD7lT21H1B0Efls5Be68XFxdbot7+mHZ40+r2zm3n7eO0/x7rD037c1L1PR3aXBH0VN1dibluTwT9iisK5KGHcs3z27EyMCsraPrHeOSrr34w7dRJKVP0GAaC3mNktj4hHQS941OWBHeoKIcTc710SUlJFzHX/Tp0JFYx1/gECEAg9QTuvDPXlMzzu4i55kzF3OMJyqGHlplSe+rzSg4g4AYCSRd0N0DDBghAIDqBykqP3HRTxyGnnc8IBj1mfgqfmSwqp/MhtiEAgV4QQNB7AY1TIACB6AQWLswyNWvR4+hRrYqfPx9B754UMSDQPQEEvXtGxIAABHpIYNUqn9TXd57tLXwiGpcAAQj0nQCC3neGpAABCHQikJ8fMH1lYuvslpcXW7xOl2ATAhDoRABB7wSETQhAoO8E9tijyXR66z4dvz9ojTfvPiYxIACB7ggg6N0R4jgEINBjAqNHN8tPf9pk2tGjl76bmjxy0kmtyyj3+CKcAAEIdCCAoHfAwQYEIBAPAlo6v/fejWb2R4+Z2TGyqD/66AaziiLLIceDOWlAAEHnHoAABBJCoLg4KF9/vUYOOKBBcnICZi6JgJnxMWBWUAwYEW82vds3yPjxDEJPCHwSTUsCXadrS0sMGA0BCCSCgC49ff/9G81a5l4z9auuuuiRkSNbZPvt3b3qXiJYkiYEuiOAoHdHiOMQgECfCZSVBcwiTJTG+wySBCAQhQBV7lHgcAgCEIAABCDgFAKU0J3iKfIJgR4Q+P57nzz/fJZ8/nmGWQwpaJYqbpIDD2ww7deRO6j1IHmiQgACNiSAoNvQKWQJAn0hoCucPfBArgTM8uH19a2VcDrRi4b58ytk552b+pI850IAAjYlQJW7TR1DtiDQGwJnn11srXBWW+ttE3NNR+dM179DD+1nldx7kzbnQAAC9iaAoNvbP+QOAjET+Pe/s2Jauez884utXucxJ0xECEDAEQQQdEe4iUxCoHsCd9+d130kE6PFzOPyzDNmPBkBAhBwFQEE3VXuxJh0JvDpp/6YzNfq+DfeyIwpLpEgAAHnEEDQneMrcgqBqARiXa5UE6mpiWHllKhX4yAEIGA3Agi63TxCfiDQSwIDBsQ2J7oumKKLpxAgAAF3EUDQ3eVPrEljAr/8ZZ1kZ7cOT4uGITMzKL/4RX20KByDAAQcSABBd6DTyDIEwhE488waaxKZcMdC+3T9cS2d7747Y9FDTPiEgFsIIOhu8SR2pD2B0tKgLFhQbnFQ4e4c8vICMnZsk7zwwobOh9iGAARcQABBd4ETMQECIQIDBgTkk09+kMmTa6W4OCBavZ6REZStt26SSy6pkiee2CC6VjkBAhBwHwGmfnWfT7EozQloSf3aayutv4YGEb8Zzebl1T3N7wrMTwcCCHo6eBkb05ZAVlbamo7hEEg7Agh62rkcgyHgDgKVlR559dUsWb3aJ0VFAdlvvwYZOrT7Xv7usB4rINCVAILelQl7IAABmxP45z9z5ZprCsTn0xXlPFZfgaYmj5xwQq3ZX2nz3JM9CCSGAIKeGK6kCgEIJIjAiy9myaWXFnVIvbGxtaffQw/liq4Ff//9GzscZwMC6UCArjLp4GVshIBLCHz3nU9OOqk0ojUq7G++mSnPPcfiMxEhccC1BBB017oWw9KFgPZkX7o0w/qrrXX3mLSnnsqWrKyuY+zb+1rXfb///pz2u/gOgbQgQJV7WrgZI91K4Prr82X27DxrWJoOTVNx//3vq+Wss2pcafJnn2UYG7t/afnqq9hWnnMlJIxKWwKU0NPW9RjudALTphXLrFn5oiXSykqvbNrklbo6r8ycWSj7799fAi7s8J2XF710HvJpd6X4UDw+IeAmAgi6m7yJLWlD4Nlns+X553MkGAxfWv3+e6889pj72pH33rtRCgqiv6nozHj77GOqKggQSDMCCHqaORxz3UHgoYeitxHX13vl5psL3GFsOysOPbReCgtV0COX1JubPXLGGe5scmiHgq8Q6EIAQe+ChB0QsD+Br7/uvvvLmjXue7yzTaXDM8/o4jIea4769p7yeFpF/tlny83c9bGtDd/+fL5DwOkE3PfEO90j5B8CMRDQmdG6C7G2N3eXTiqOL16cKb/5TYlsv/1AGT58kPU5dWqJLFqUKQMHBuSzz36QX/+6ziqt6wI0OTkB02+gQf797/UybhxLw6bCZ1wz9QS6f81PfR7JAQQg0InAYYfVy7JlGVYnuE6HrE2fLygHHODMduQLLyw0q8LlSE3NlvKGTvP60kvZ5i9Ljj22zjQnbJabbmr9YwGacHcA+9KRwJYnJh2tx2YIOJTAKafUms5hQbMUari25KC0tHjkssuqHGfdjBmF8vDDuR3EvKMRHkvsL7qosG23LkDDanJtOPiSxgQQ9DR2PqY7l0B+flAWL15n9XLPywv8KOxBqwe4Vkm//fZaKSvrvlreTgTee88v8+blis7JHi3obHCPP54j777LWPNonDiWfgSock8/n2OxSwjkmI7uK1askVdeyZIlS/zWuPMdd2yWAw+sl9xc5xl5zz15MY+dr6nxyN1358nuu29ynqHkGAIJIoCgJwgsyUIgGQT8ppB68MEN1l8yrpfIa2iHN+29HltonbM9trjEgkB6EPAETXCbqQ3aS8YhwW9+kZua3N0r12saONXOxsZGU0Xsututw52WDv70mTVLMzJ0Ctb4PmclJZmmk1+sgi6mZ3tQNm5s7MA/nhsej8e0zXtNfwR3D4FTX6qt6fA7pPdHwMFTKGZph5EowZUl9IqKiigm2+tQaWmpOCm/vaGnN6HauXnzZmlubu5NEo45Jx38mZeXZ4aLFcb9vi0qGmAE3SxwHmPQGeMS+eyo0OWatovKSnevr15UVGTWk89MKMsYXZrQaNlmEgN9QautrU3odRKZ+ODBg6MmT6e4qHg4CAEIJIvAfvs1ROi13zUH2rtf4xMgAIEtBBD0LSz4BgEIpJDA6afXWNXosWRB57A/7TSmd42FFXHShwCCnj6+xlII2JqA9tA/88zqLlO6ds603x+UP/6xUn76U3c333S2m20IdEfAlW3o3RnNcQhAwJ4Efv/7GtEpa2+4ocB0ovRYE+SEcqqz3+myqGedVS3nnEPpPMSFTwiECCDoIRJ8QgACtiBwxhm1Zix9o9x7b64sXJhlerJ7pbg4IBMmNMjJJ9fKtttSMreFo8iE7Qgg6LZzCRmCAAS22aZZrr3W3b3L8TIE4k2ANvR4EyU9CEAAAhCAQAoIIOgpgM4lIQABCEAAAvEmgKDHmyjpQQACEIAABFJAAEFPAXQuCQEIQAACEIg3AQQ93kRJDwIQgAAEIJACAgh6CqBzSQhAAAIQgEC8CSDo8SZKehCAAAQgAIEUEEDQUwCdS0IAAhCAAATiTQBBjzdR0oMABCAAAQikgACCngLoXBICEIAABCAQbwIIeryJkh4EIAABCEAgBQQQ9BRA55IQgAAEIACBeBNA0ONNlPQgAAEIQAACKSCAoKcAOpeEAAQgAAEIxJsAgh5voqQHAQhAAAIQSAEBBD0F0LkkBCAAAQhAIN4EEPR4EyU9CEAAAhCAQAoIIOgpgM4lIQABCEAAAvEmgKDHmyjpQQACEIAABFJAAEFPAXQuCQEIQAACEIg3gYx4J0h6EIBA+hCoqPDIv/+dLZ984hevKR7stluj/Pzn9ZKdnT4MsBQCdiGAoNvFE+QDAnEisGhRprzySqbU1Xlkr72a5PDD6+OUcsdkPv44Q44/vkwaG0Vqalor++bNy5GzziqRzz//QQoLgx1PSOFWICDy1VcZsnq1V0pKgrLDDk2SmZnCDHFpCCSAAIKeAKgkCYFUEbj66nyZPTvfElkVsdmzRQYPDshbb62TjDg+7V99JfKzn/XvYmarsAdl550HyrvvrpWystSL+tNPZ8sVVxSalw6PVYugmW5uFjnttBqZMaO6iw3sgIBTCdCG7lTPkW8IdCIwd26O3H57gdTXeyQQ8JijrX9r13rlzjvzOsXu2+YZZ5jUPZHEWq8rcttt+X27SBzOfuCBHDn99BJZs8YnlZVe2bSp9a+62is33VRgahhK43AVkoCAPQgg6PbwA7mAQJ8JPPBAbtg0VNxvvjnfiHzYwz3eqaXbN94QCQZbhTtcAg0NHnnuudQ2pL/5pl8uuqg4XPba9r35ZqbMmhXfl522xPkCgSQTQNCTDJzLQSBRBNat80VM2mO0d/PmyAIc8cQwB6pNLbV2gOsuVFXFEKm7RPpw/JZbtIYgUi1Ca8KNjR656658aWnpw4U4FQI2IRDHVjWbWEQ2IJCmBLbeullWrVIR7SrcQaNr8eqkVlQUm6APHpxalXz/fe311pVF59tDxfybb3wyenR881tbK/Lqq1nywQd+qxlk221bTL+DeunfP05VJZ0NYTvtCSDoaX8LAMAtBKZPr5bXXisLa87vf18tvsgF+LDnRNqppf2jjxaZOzcoTU3hBdPnC5r2aaNoKQzalyCWoLUNrbUJHQVdmxY2bdK+Aq1/saQViqMjDU4/vdh0TvSYtDUfHsnNDcif/lRoOuJVmpEAqWUTyief7iKQ2joxd7HEGgiklMBeezXKI49ssPJQVBQwJfKA5OQE5Mwzq42A1MQ1b3/9q0hWVtC8JHSt0vb7g1ZtwLRpqRWtkpLYSsI67G7YsFYxrzcj/O6+O1f23LO/jBjRT7bdNtf8DZRTTy2WL7+Mrfzz1Vc++fWvy2TDBt+PLwqtLxa1tV6rpH799YVG2Avi6g8Sg4ASiO0OhRUEIOAIAnvv3SifffaDGTKWaZUOd9mlUYYMiU3YemJgv35iJpNZa6qQ+8nKlT6r9K8l2aYmkf33bzDt0ptiamfvyTV7GvfII+tkzpw80Q560cKIES1WNbiKudqzerWvbVy92qOl6xdeyJZnn82RJ54olz32sHaGTbK21mPG/Rs4UYLWasydmyuHHVZvzRMQJSqHINAjAgh6j3ARGQL2J1BcHJSDDmpIeEZ1YpYFC8pl+XKfLFumPyUeGTu2qa20m/AMdHOBc86pkUcfzTGCHr2t4frrN1svIltvPdiqcWhp6foCENp31FH9oor6yy9ndZOr1sM6Jv7ee/OMoJs6fQIE4kQAQY8TSJKBQDoS0PbnbbZpsf4SZb8Ot3v77UwzVC5T1q/3ylZbtcjBBzeYqnDTyB0laOezV18tNy8ZA03zQMAI+5YWRm0qyM4Oyj//uVF2373JlORzzHbAVIlviRMp6QsvLLLSDXf8/ff9P1azhzvafp/HdJZjqrr2RPjedwIIet8ZkgIEIJAgAjrUTid/+eabDGumNy0pZ2YGzaQw+fLLX9abz81Rr9yvX8A0Dfwgf/97njzzTI6Ul3slPz8o++3XIGefXdP2UjBnTm5MYq4X0yp5rZUYNapjJzo9piXvWINW8RMgEE8CCHo8aZIWBCAQNwIqeDvsMMi0xQd/nPmuNWntOa7V+489lmO13z/8cIXVEz3ShUtLg3LJJdXWX6Q4y5fH/lOofQWWLvWHFfTttmu2OiLW1XVf0te2ewIE4kmg+7sunlcjLQhAAAIxErjkkiKrTbt1GtuuJ6mwL1niF10Qpq8h0jUipdvaWa7rUR1nHkvQ6v7Jk1M7CiCWfBLHWQQQdGf5i9xCIC0IaLv5M89kmxncoldh62Iw990XfsrbnoAaMCD20rKO59d2/HBBRxR0N1xP58DXMfLHHFMXLgn2QaDXBBD0XqPjRAjYk4CK4YYNHmupUKdOafrdd9F7prcnr8ui9jVMmlRndYqLJZ2MjKDsskvkoWuXXFIlU6bUmNXtuo7Rz88PWO32X3+9Rvz+WK5GHAjETqDvT0KM11q7dq384x//6BD7pJNOMkNchln7nn76aXn99delnxngevLJJ1ufeqCiokIef/xx02a1VMaNGycnnHCCaVPjPaQDSDYg8COBL77wiQ6tqqxsLdnqo3L//RUycaKZPcVhQduqYwmxxouW1qmn1ogubhNLR7XLLqvqdinaG26otDrtzZ6dJx9+6LeWsx0+vMWqZj/22DrWYo/mDI71mkDSlPGzzz6Tr7/+2gwhGdv2l5vbWlWmYq5/xx13nHlr9cv5559vOsG0ToYxc+ZMs6jEZvMgTJaFCxea9Z1n99pYToSAmwnokK6JEwdYi7DoSmj6p1XWU6aUmYlMUrvyWU+5a5X2jz8B3Z669dbhq7+7PbFdBF23/fnnW2fZ00544YL2rr/wwipRQY4l7LtvozUs7v3315me9uvM6nMbZOpUxDwWdsTpHYGkCfqyZctk/PjxcuSRR7b9lZa2rkU8Z84cOe+882TXXXe1xNxnGqneffdd+fzzz2XFihUyffp069ill15qldZbnFqP2DsfcRYEYiIwZUrJj/G6Fm0vuaTYUSuKaTv14YfXmxf88OIaAqLie9JJ8ZnWVl8iPvhgrfz85/XWtLY6fa5O0lNQEJChQ1vkb3/bZH6LzFJzBAjYlEDSqty//PJLGThwoFx++eWiQj5p0iQZPny4NJsVELQ6fvTo0W2IRo0aZQm5xtP9nh/r1DR+XV2dbNy4sa1KXk865JBD2s7V+LNmzWrbtvsXbT7o37+/3bPZp/yF/FdSEhKcPiVn65NT6c9lyyK3O+t85c3N/WXQoL7jC/kz0fftrbeK/Oc/uuxrMGznOG2jHjlSTGFAl0nVv74HfRSffFJMk0WLKVWL+b3RiWwCZuIcM1DOo/Ovu28Odr1n1aeJ9mffvdO3FEL3bV5eXt8SsvHZSRP0devWWYJ+zDHHWKXvU045xUzL+Kgl0BkZGeaNeMuUifn5+WaVo01mOsYm83bc8QEKHdO29lDQtvVQGDp0qGmvck57odrtpPyGOPfkU38wtNZF/RnUdTxdHFLpT5+vu+FbjVZbbl/x6/Oq/kz0fWt+BuSrr0R22ilbdA12/dPhZVpq15+LiRNb5MEH42NTZybZpoVijz223LeRhql1Ps+J25lmDl99RhPtz1Sz0XtWRV0LkU4N+uxFC9GPRjuzh8fuv//+tjN22mkn+eijj+TFF1+0Stf6Q69t5npTaWhoaDBVXEMtkdfv7YNuF+mCzO3C9ddf325LZM2aNR227byhtRDaR8DNQUUu2/xCVptfZCc/TLH4KJX+3H13n+lnEn4NcF0Zze/fbO61WKyIHkdLOCoCybpv33prszXta+vUrz5Ts9di5qqvN0LfbIl89Nz2/qj+eGo/n8rKyt4n4oAz9fc0mf5MFRL9DVKNqdWF6h0aQv3OImU/KYKugv3qq6/KhAkTrE5vmhn94VOwejNpR7jy8nIZMGCAlc/169fLPvvsY5UC9HsohAShrCz8ms+heHxCIB0J3HPPRjMkqnOdutaIeOStt9abHzNnUjEFK7OCW6P150wLyDUEkkMgKY+4CvYjjzxilh981rJKS9CvvfaaHHDAAdb2xIkT5eGHHzbtZC3W8LTly5dbPeF32203WbVqlZkNaolVgp83b57svffebSX55CDiKhBwBgGdo3zFijXW8qW6Drr2yh4zRl+m11nLgzrDCnIJAQj0lkBSSuiauXPPPVfuvPNOq91cO8FNmzbNdDbZysr3qaeeKhdffLEZDnKs1cZxwQUXmN6lxdaxGTNmWMcKCwutUv3VV19t7ecfBCDQlYBOVjJvXkXXA+yBAARcT8BjOikltZeStkdpG5x2UOgctPe6CnmoN2LouJbctbq9c9t56HjnT6e1oevkOW4O2oauTSzafJIObehu96c+v/qC7aTnrDfPV7q1obdv3uwNL7uf44Y29MGDB0fFnLQSeigX+kMQKUQa1qTiH6uYR0qb/RCAAAQgAAE3E0i6oLsZJralL4FNmzyyaJEOQfRKWVmm/Nd/NZqe/enLA8shAIHkE0DQk8+cK7qMwG235cktt+Rb83vrVKs+X4nU1HhkwYL1ZkKSvk9L6jJcmAMBCCSIQFJ6uSco7yQLgZQTePzxbLnmmkIj4F4zLttr+np4rM/mZo8ZpjnADBdjSa2UO4kMQCBNCCDoaeJozIw/gTVrvHL22SVRE77ggtbRGlEjcRACEIBAHAgg6HGASBLpSeD//b9sM5NY66qAkQiUl3vNKoNdR3REis9+CEAAAr0lgKD3lhznpT2Bdet0GsmuK5u1B6NTL69di6C3Z8J3CEAgMQQQ9MRwJdU0IDBoUMCU0KNP46CLegweTMe4NLgdMBECKSeAoKfcBWTAqQQOPLC+26wPHBgwS3x2FHTtOHfzzXly1FGl8qtflcr//V+umdq426SIAAEIQCAqAYatRcXDQQhEJjB4cECmT6+W664rCLtet545d27HWQDNpIfWAirZ2QGpr299n37zzUwrjQ8/XGvmX498PY5AAAIQiEaAEno0OhyDQDcEzj67Rv76102Snx+w/jIytAq+9W/06CYzhK1jG7uWyD2eYJuYa/LBoMcat37XXXndXI3DEIAABCITQNAjs+EIBGIicOyx9WYd8vWWKGsJXJcr1b+vvvLLwQf3/3GNchFtT1+yJNMS8M4J67j1O+7I77ybbQhAAAIxE0DQY0ZFRAiEJ6DLG02eXGqEurW03TnW735XYnrDizXpTGsJvnOM1u3uesyHP6tne/Wl4sMP/fLYY9ny8suZVr56lgKxIQABuxKgDd2uniFfjiGgndy++UYfpY7V6yEDdOja++9nyvjxjZKTE4wooiNGNIdOScinDrP71a/KzKp3XuvlQxc83LTJK088US577GGUngABCDiaACV0R7uPzNuBQH29R/x+bTcPH3SFYi19q4Cec051+Ehm75VXVkY81tcDVVUe2WWXgbJ8uU8qK71SVeW1xFzTPeqofvLKK/TG6ytjzodAqgkg6Kn2ANd3PIGSkoC1MEskQ1RAt9++tfR92mm1cumlm038oFkSOGD96WxzN964SSZObIyURJ/333ijLh6jLx3haxEuvrioz9cgAQhAILUEqHJPLX+u7gICWqV+1lnV1iIt4cyZMKFBhg/fMhb97LNr5fjj6+W99/zWi8C4cY1SUhK5hB8uzZ7uW7AgW7TjXaRQUeG1quL792dAfCRG7IeA3Qkg6Hb3EPlzBIH/+Z8aqwpbh55lZwfNuHQx1fAi48Y1yQMPbOxiQ1lZQA45pKHL/kTt0M5w0YLX1NU1Jq6CINqlOQYBCMSJAIIeJ5AkA4H//d8qU1L3y3PP1ZvSsMjYsU2y667dKGmSsO20U5N8/70v7JA5zYIKus5qR4AABJxLAEF3ru/IuQ0JjB4tMnWqGaNms3DuuTXy/PM5EXN15pnVUfsBRDyRAxCAgG0I0CnONq4gIxBIHIGdd24yY8/LrQtkZra213u9QcnLC8iUKTWigk+AAAScTYASurP9R+4hEDOBvfZqksWL11mTyixd6pdBg1rk0EMbrPHxMSdCRAhAwLYEEHTbuoaMQSA2AjU1HquH+oAB4ZdzXbQoU+bPzzFT0WaYEnlQtNf9NddUSr9+tJnHRphYEHAGAQTdGX4ilxDoQuCLLzJEx4/rVK5ZWUHTS90ju+3WaOaE3yQ6/EyXZD3llGJZtCjLmnY2NAb9nXf8ctVVhWbq1/Wy3XaJnZ2uS6bZAQEIJIwAbegJQ0vCEEgcgdWrvWYimv7y9tt+aWjwWLO/6Yx1b7yRKTvvPNCUxn3yy1+WyYsv5hgx18d8yxj0urrWx17P/+gjM7aOAAEIuIIAgu4KN2JEOhGorxfZc88BP5q8Rahbd+h20JqzXUvu3YXp05khrjtGHIeAUwgg6E7xFPmEwI8E3nkn02oLjwzEY01yo2PhuwsrVvis8endxeM4BCBgfwIIuv19RA4h0IGAtp1rNXu00Crm0ePo+bqozDffmFVjCBCAgOMJIOiOdyEGpBsBXYI12rrqysPTvZb/iM1jTVWbbgyxFwJuJICgu9Gr2ORqAnvu2WitZx7NSLNia9QlXUPn6vztY8bEUDcfOoFPCEDAtgQQdNu6hoxBIDyB0aNbZP/9G0wpPPwKbToT3N57N1pD2cKn0LpXz580qU5yc8OnE+1cjkEAAvYjEPM49Ndff10+++yzmCyYOHGibLPNNjHFJRIEINBzAvfcs0kOPLCfLFuWYcabb6lfLygIWGPRH3poo/znP1ny29+Whk08KytgrQb3l79Uhj3OTghAwHkEYhb01157TW688UapqKgwJQOPWd95uKxYscKyOCsry5QGstqs//vf/46gt9HgCwTiT0BXR3v55XKz4EqWPPFEjqxa5ZNhw1rk17+uk4MOal2WVT+feaZcTj+92BqnrufokDadgOaII+rlL3/ZbK2yFv/ckSIEIJAKAjEL+sEHHyw33XSTPPjgg2Yd50PMtJH9ZM2aNTJnzhy588475b333pPS0vClgVQYxjUhkA4EdC52/YsUdPnWt99eL0uXZpgXcJ9Vvb7LLk1SVEQ1eyRm7IeAUwnE3IZ+++23y4knniiTJ0+2xFwNHjx4sFx00UXW9uOPP+5UBuQbAq4moD3ed9yx2RL+CRMaEXNXexvj0plAzIJeV1dnVbV3htVsBrxu2LBBmpqaOh9iGwIQgAAEIACBJBGIWdAPP/xws+jDHfL0009b4q1Cru3qZ555ppSXl5u3/0OTlGUuAwEIQAACEIBAZwIxt6FPnTpVvv76a7Pgwy+tknpmZqbUm0mltdp93rx5MmLEiM5psw0BCEAAAhCAQJIIxCzo69atkwsvvFCmTZsm77//vqxcuVK23npr2W+//SQ/Pz9J2eUyEIAABCAAAQiEIxCzoP/5z3+WJUuWmOUZ3zDDY4aFS4t9EIAABCAAAQikiEDMbehVVVUdxpqnKL9cFgIQgAAEIACBMARiLqFfcMEFcswxx5h1ln8lEyZMkEGDBnXo9T5+/HjblNx14hsnBaflt7ds1c50sNXtNobsC3329n6w+3kh+0Kfds9vb/MXsi/02dt07H5eyL7Qp93z25v8eYImxHLiWWedZU0gEynuww8/bAl+pOPJ3K+d9ZwS/H6/64f8ec0UZdqJsqGhwSwqEtPt5hT3dclnOvjT5/OZaWP9VqfYLgBctEN/+NVWHdHj5qC+VFsbdaUeFwf9HVI7W1paHGtldnZ21LzHLOjRfoh1DHogEDDLMEa/WNScxPGgzmDnlKCz6+l0um4OOi2w2rl+/XrX/zimgz/z8vKksLDQminSzfdtRkaGmVkv10yb6+757ouKiqwXbn0+3RxUn1TUa2trHWumjiqLFmJuQ58xY4bcdttt1huOvuW0/xs3bpw1JWy0C3EMAhBIHYH1671y9925csYZxXL22UXy0EM5YuaKIkAAAi4iELUNffXq1TJz5kzL3IULF1pv5UuXLu1gvnaW++KLL9qmg+1wkA0IQCDlBL76ymcWY+lnmnbEiHjrO/wLL2TLjBnF5tn9QQoK3N0MknIHkAEIJIlAVEEfMmSIVUXx6aefysaNG602s86Cru0v06dPl8MOOyxJWeYyEIBArAS+/95n1k4f0CV6q7AHZeLE/rJw4TpTtdwlCjsgAAGHEYgq6GqLVrNrmDVrljUrnPZ0J0AAAs4gcMsteZKRETR9F8KN/PCY9mGPPPZYrkyd6tx2RWd4glxCIPEEuhX0UBbOPffc0Fc+IQABhxB4/fWsCGLeakB1tdeU0DMRdIf4k2xCIBqBmDvFRUuEYxCAgD0JmMEn3QYHj+Lp1jYiQCCdCCDo6eRtbE07AjvuqMsaR+70lpUVkHHjWPo47W4MDHYlAQTdlW7FKAi0EjjjjBozOUpkGg0NXjP7I+PXIhPiCAScQwBBd46vyCkETCfVPNl55wEycuQg2WOP/vL881lRqey5Z5PcfvvGH+NsKan7fK3fX311nensGkO9fNSrcBACELADAQTdDl4gDxCIgYBODHPNNYVmxj2fmabTI99/n2GWMy61JoyJdvqRRzaYnuzlctBBDTJkSItZc6FZJk2qk9deWyfbbOPcaTCj2cwxCKQjgZh7uacjHGyGgF0IfPllhlxxRVHY7NxwQ4Ecf3ydmfhpSwm8c8S99mqSvfYKldQ7H2UbAhBwAwFK6G7wIja4nsBbb2WayV/CV42bKcdlyRK/6xlgIAQgEJ0Agh6dD0chYAsCfn/QzNoYOStZWZFL55HP4ggEIOAmAlF+ItxkJrZAwNkE9t230czFHm62N5HNm73y058y9MzZHib3EOg7AQS97wxJAQIJJzBsWIvceWeoDby1NO71tn6+8sp65mJPuAe4AATsT4BOcfb3ETmEgEXg5z9v7a3+j3/kyerVPhk1qtkshVoj227bDCEIQAACgqBzE0DAQQRae6tvclCOySoEIJAsAlS5J4s014EABCAAAQgkkACCnkC4JA0BCEAAAhBIFgEEPVmkuQ4EIAABCEAggQQQ9ATCJWkIQAACEIBAsggg6MkizXUgAAEIQAACCSSAoCcQLklDAAIQgAAEkkUAQU8WaRte584782T8+P6y9datS3E++GCODXNJliAAAQhAIBYCCHoslFwY55pr8s1SnAWyYkWG1Ne3LsV54YXF8t//3U9aWFHThR7HJAhAwO0EEHS3eziMffPm5chttxUY4e46N/i332bI/PmU1MNgYxcEIAABWxNA0G3tnsRk7tFHIwt2Y6PHzBmel5gLkyoEIAABCCSMAIKeMLT2TXjduuhur6iIfty+lpEzCEAAAulLgF/uNPS9LuohEnn97K22ohE9DW+LPpscjHxL9TltEoAABLongKB3z8h1MU45pTaqTb/7XU3U4xyEQHsCTz6ZLQcf3M8aLTFixCDZb79+8s9/5raPwncIQCAJBBD0JEC22yX23bdRbrhh84/ZChWrgpKZGZRLL62Uo4+ut1uWyY9NCcycWSDnnVcsn37ql4YGjzQ1eWT5cr+5j4rkqKPKbJprsgUBdxJg+VR3+rVbq6ZMqZPRo5tl7txc+eqrDNFq9mOPrZWJExu7PZcIEFACc+fmyB135EeE8d57fvnznwvkT3+qihiHAxCAQPwIIOjxY+m4lPbcs0n23DNUUndc9slwCgloe/ktt0QWc82aDoucMydXLrywSnIiD6xIoRVcGgLuIkCVu7v8iTUQSAqBykqRdet83V4rwxQZPv/c3208IkAAAn0ngKD3nSEpQCDtCDQ0iPh8of4Xkc33mLmLNC4BAhBIPAEEPfGMuQIEXEdgwAARbwy/Hirm226rwyQJEIBAognE8EgmOgukDwEIOJHApEl1ZmREIGLWPZ6gjBvXJCUl3ZfkIybCAQhAIGYCCHrMqIjYFwKffSYydWqhjB07QPbZp7/89a/RO1TptXSRmM8+yzC98Ltvq22ftzVrvHLOOUXy61+XytVX50sjHffb44nbd+293tjoFRXuzkH3BYMeue++jeZ456NsQwACiSBAL/dEUCXNDgR++MEjY8aI+WHPtH7ky8vFCHqBvP12pvzrXxUd4oY2NmzwyJFH9pMNG7zWanDaq/rzz3/otrf0+vVe2W23gSYZFRmPLFqUJbffXmCdW1jYVXhC1+Oz5wRyc4OycuUa+e1vS+TNNzPFb/q+qZ8CptCuQyLvvXej5OfDvOdkOQMCvSOAoPeOG2fFSEB/4A84oMiKrSW29uHdd/3y7LPZcvjhHSey0ZL5T386yERVMWg9R0t8J55YKg8/HP4FQNNtNk21O++sYq6h47UmTSqTBQvMmwQhrgR8pvLkwQc3yurVXvn4Y78l5ttv3ywjRrTE1MYe18yQGATSnACCnuY3QKLN1+rujRs7imvomnV1Hnnttcwugv7ppxmSlxeQmpotLUL6MvDOO5lSVeWRgoLwpT4tnbd/CQhdRz+//JJbvT2PeH8fMiQgQ4bQnT3eXEkPAj0hsOUXsydnERcCcSKg45Q7B626Dbe/dahU59hbtrW0SHvtFh58gwAE0osAgp5e/k66tZmZItts0xJBaD2y//5dS3VaZTtsmFbZbimJ+/1B2WGHZtF220ihtDQgxcXhe12PGdMU6TT2QwACEHAFgZQI+k033STvvvtuB4BPP/20XHzxxWbRkBukXHtN/RgqKipk9uzZMmPGDNNW96Bpowv/gx2Kz6e9CGiJee7caquzVPuJSLRNfPr0KjnkkK6Cruc8+eQG42uPKakHJTs7KAceWC///veW+yKclVqqX7iwfRwV/6AUFgbkhRc2hDvF8fuqqz2yapXXGhEQMqbWLKZ3xx15csQRpTJhQj859dQief/9MFUhoRO6+dy82WOmec0zviozw9AGyF575clll4m0NnF0czKHIQCBpBHo/VPeyyw+9dRT8vjjj8tOO+3UloKKuf6dccYZ5gd5oZx//vly//33mxKaV2bOnGlKa8Nk8uTJctddd0mt+bU69dRT287li/0JDB0akE2bxKzKVS+LF2eIlqR/9as60QViIgUtia9evcb0cldRFykqilwyb59GWVlAli37wRI0Hb62yy5Ncvzxka/T/lwnfX//fb/88Y9FVt8Arb3QjoSHHVZvnp0qOeig/tbKZ6GOgcuWZZjOh7lGkOutYWQ9sXPdOq9Jr5957jzmr/X9f+1akRtvFPNsDjQjFdZZtSk9SZO4EIBAYgh4giYkJumuqa5cudIsq3ipGcqSb5ZWPMr8wBxiRTr22GPl8ssvN0ObzNgmE0488UQ5++yzTcmq0Ir/yCOPmCpbj3z33XeW6Kv4+7TBNEJYs2ZNhCP2211aWipaC+HmkJWVZUS81JTo1pue6O6eNSwZ/ly6NMPUWPTvcstoE4XWakTqGKgnaE3HnDkbu5wbbkdFhce8eHccbRAu3qJF62TkSPNG4bKQYd4kc3NzpVInrndxKCoqMhMEZVrPp4vNNDV92VYhUQuFTg2DBw+OmvWkldD1h1xL21p1rqXvUND9a80r/+jRo0O7ZNSoUbJixQpLBHS/irmG4cOHS11dnek1vVH69evXFr99aX/77beX+fPntx1zwpdBg/RH0/2hvc/cbG0i/bnZLI534IGtz0Nnht2JucZfsCDLVNEPMmP1O5/ddfuqq8T80AfN5DHhr6dnaDPK9df3N7VuXc93yx4V9XQIibxv7cRPC4puDUkT9Pvuu8+0v40zM4WN7cBS28v1TVhLcaGgJfhNpo62qanJDFEqCO22PkPH2otD+yr4/v37S3V1dYdz7LyRY9aV1JcUNwetTdEfRX0zdnsfiET785lnMkzNVbYpNUYS2Uj7t9xh113XJP/8Z9e+C1titH6bPz/Pmgmu8/7227pE6osvBmXz5moj7u2POP+7Nvn5zZCLBpevLqMlV31Ga2pqnO+0KBaozmjhUHXFqaGzHna2IymC/sknn8grr7wiN998syXUWirXH/f6+noz81eOBVh/6PUB0qAP0NChQy2R7/ww6bZWEbUP5513XvtNcVKVu1Z1OekFpAPoGDf0ZS0k6G6vck+0Pz/5JN/cLzGCDxvNY2bNk27vOW2T37w5P2wKnXdqKf3bb2tl4EB3dVgNVbm7/flUMVehc7udbqhyt4Wgf/jhh2ZCkCqZNm2a9VugbVKfm18VLYWfdNJJ1luwltQH6BJOJmhb6z777GO9Ner3UNAbTgWhrKwstItPCKQVgdzcgFUNXl/ffUk8EphIE/O0j6/v1trZrqmp++tolXwsabZPn+8QgED8CbQWieOfbocUp0yZYoYhPdn2t5tpwLvgggssMdeIEydONFN6Pmx66rbI0qVLZfny5VbVvMZbtWqVLFmyxKqqnTdvnuy9995tJfkOF2EDAmlA4L//u8Hc/30xNCi/+EV9twlot5WddoqtalLnDIg2P0C3FyMCBCAQFwJJqXLvLqfaBq5j0LW3u1b9qNgXFxdbp2knOj2mHRm0B/HVV1/dXXIch4BrCegkPUccUW9egHOMjd2XnjuC0AEtHjnhhNh6+Z5/frWpVfObPh7R3yA0HgECEEg9gaQOW+vOXO29rkIe6tUeiq8ld61u79x2Hjre+dNJbejJGObUmU+ytxm2Fn/ip5xSYibLyTLV72ItD6urmmnJfb/96q0x512v2CrmX3zxQ4+qx++6K1euvLJjn5VQ2jpMbsaMKjP23Z2dqUJt6AxbC3nc2Z9uaEO3zbC1WG6FkpKSsNG000asYh42AXZCwGUEdGlSHY/+8stZpvOaxwz7bDGr2jWY/iUBeeCBRrn22gIzvLO1ZK1Cv8cejfL3v2/qkZgrstNPrzVDRANy1VWF1jK2KuLBoNf0b/EYIa+U3/0uttK+y/BjDgRsScBWJfR4EaKEHi+S8UmHEnp8OPY0FV3pTle003XgtU28L0FnXP7qqwwzZ4TXjEDJkj33zDedV50zgVNvbKeE3htq9j2HErp9fUPOIACBbghodbxODBOPoKX8bbdtNn9ilrb1W9PxxiNd0oAABOJHoLVOLn7pkRIEIAABCEAAAikggKCnADqXhAAEIAABCMSbAIIeb6KkZxsCjzySY3p995eRIwfJ9tsPNAv+FFk9wm2TQTICAQhAII4EEPQ4wiQp+xDQ4VbnnltsJinKsBYXqaz0momNcoy4DzazFvaxh5h9zCQnEIAABNoIIOhtKPjiFgJffJERduy0rkaWkRGUP/zBvastucWH2AEBCPScAILec2acYXMCL72UZRb2Cd+7u7nZIy+9lG1zC8geBCAAgZ4TQNB7zowzbE6gutpjVuyLnEkdm02AAAQg4DYCCLrbPIo9ss02zdZkKpFQjBjRHOkQ+yEAAQg4lgCC7ljXkfFIBH72s3rJz9e1ucNXu194IYuJRGLHfghAwLkEEHTn+o6cRyCQYxYiW7Cg3Bz1mGU9W4U9OzsoOTkB+fOfN1urlUU4ld0QgAAEHEvAFsunOpYeGbctgaKioHz99Rp58cVs+fLLDGtRkgMOqDfV8S22zTMZgwAEINAXAgh6X+hxrq0JZJvO7EceWW/rPJI5CEAAAvEiQJV7vEiSDgQgAAEIQCCFBBD0FMLn0hCAAAQgAIF4EUDQ40WSdCAAAQhAAAIpJICgpxA+l4YABCAAAQjEiwCCHi+SpAMBCEAAAhBIIQF6uacQfrIu/dxz2bJsWYaUlATkN7+pFQ8znyYLPdeBAAQgkDQCCHrSUKfmQpMmlcrHH/vN3OYe8fnErDRWZJYUXWMmWUlNfrgqBCAAAQgkhgBV7onhaotU7703V956K0tqa73S0uKx1gXX5UNnzCi2Rf7IBAQgAAEIxI8Agh4/lrZL6Zlnui4TqsuHLliQZbu8kiEIQAACEOgbAQS9b/xsfba2mYdboETnNSdAAAIQgIC7CCDo7vJnB2suuKBavJ087PcH5ZprNneIxwYEIAABCDifQKefe+cbhAVbCIwZ0yyPPrrB2pGXFxAV88suq5QguAW0AAAc00lEQVTDDmvYEolvEIAABCDgCgL0cneFGyMbseeeTdaqYzU1Hqtne26uM6vbV6/2ypIlfrPOeVB23bXJ+oxsNUcgAAEIpB8BBD0NfK6rjjm53fyKKwpkzpxcU8NgVjg3Y+g3b/bKq6+uN0uhNqeB9zARAhCAQGwEqHKPjROxUkRg1qw8ufvufKmr80plpdcSc83KhAn9rclyUpQtLgsBCEDAdgQQdNu5hAyFCLS0iNx8c0Fos8OnzxeUf/wjt8M+NiAAAQikMwEEPZ29b3Pb6+sjz1GrE+UsX06Lkc1dSPYgAIEkEkDQkwibS/WMQE5OMOK88x5PUIYNM0V4AgQgAAEIWAQQdG4E2xLQMfRTp9aITlfbOQSDHpk2rabzbrYhAAEIpC0BBN3Brg+YieC+/DJDFi/OlPJyd7ryyiurZJ99WsfN5+QEpKAgYIbfBWT+/A0ydiy93B18+5J1CEAgzgRohIwz0GQl12A0btKkMquntw7n2rTJK+edVyUXX1ydrCwk7Tpz526Ujz7yy/vv+yUvL2gJ/JAhOq0tAQIQgAAEQgQQ9BAJB30GTQ30NtsMMiuomZnaTdVzKNxyS4H06xcwVdG1oV2u+Rw7tsmUyJtcYw+GQAACEIg3AXfW08abks3S02p2rW5vL+ahLN55Z37oK58QgAAEIJBGBBB0Bzp740avFBZ27SimplRWbimxO9A0sgwBCEAAAr0kgKD3ElwqTxs9ulm0Db1rCMp229FRrCsX9kAAAhBwPwEE3YE+1nbyk0/u3E6uJXaPmSZ1owMtIssQgAAEINBXAq7sFJeR4RyzPGa1kd7k94or6uQnPwnK3/6WK1VVHlMyb5Frr62WrbbSdzR7vaf5fD7rPu2NnX29wZN9fm/9mex89uV6Xp0gwAS3+1PvW/zZlzvFXuemgz89QRPshb3vuampcc6EI9lmKbT6+vq+G23jFPRBUjvr6upMZz53DzdLB3/6zTjJzMxMcdJz1pvHQ8VcbW1sbOzN6Y45R32pz6g+n24OIUFvbnZus2ReXl5UFzmnKBvVjI4HKysrO+6w8ZaWcpyU396gzMrKsgS9urpanPwwxWJ7OvhTf1RUBNx+36ovc3NzXW9nUVGRVRPhdn/qy7bWLtXWdm6ujOXJtkec7gTdXnWz9mBGLiAAAQhAAAKOI4CgO85lZBgCEIAABCDQlQCC3pUJeyAAAQhAAAKOI4CgO85lZBgCEIAABCDQlQCC3pUJeyAAAQhAAAKOI4CgO85lZBgCEIAABCDQlQCC3pUJeyAAAQhAAAKOI4CgO85lZBgCEIAABCDQlQCC3pUJeyAAAQhAAAKOI4CgO85lZBgCEIAABCDQlQCC3pUJeyAAAQhAAAKOI4CgO85lZBgCEIAABCDQlYArF2fpamb67Xn99UxZvDhTiooCMm1arVlNKf0YYDEEIACBdCKAoLvQ21deWSD33NO6zJ4K+RVXFMmyZT9IXp7rVsp1ofcwCQIQgEDvCFDl3jtuSTnrySezZb/9+svYsQPk7LOLzNKj3V/27bf9ctdd+dLS4rH+Ghs9kpERlAsuKOr+ZGJAAAIQgIBjCSDoNnXdrFl5cu65xbJ8eYaUl/vkqadyZPjwwVJXFz3DH3yQadYeD3SI1Nzskbfeyuywjw0IQAACEHAXAQTdhv5cv94r111XKE1NnrbcaYlbhfrWW/Pb9oX70q9fIEx7eVDy86luD8eLfRCAAATcQgBBt6Env//eJ8XFHUvZms36eq988ok/ao6PPrpOhg5tkayskIDrp0fmzq2Ieh4HIQABCEDA2QQQdBv6T0vZdXVbSuehLGpb+MCBLaHNsJ8ec9orr5TLlCm1MnJks+y2W5P85z/rZautop8XNjF2QgACEICAYwjQy92GrlLxPeaYWpk/P1caGlqF3eMJmk5xHvnTn6piyvHMmZUxxSMSBCAAAQi4gwAldJv68S9/qZTjjqsVrzdo/e2wQ7Pp2LZOCgpCVek2zTjZggAEIACBlBCghJ4S7LFd9LrrKuWaayrN8DMxQ89MS3jXWvjYEiIWBCAAAQi4ngCCbnMXe00div4RIAABCEAAAtEIIBXR6HAMAhCAAAQg4BACCLpDHEU2IQABCEAAAtEIIOjR6HAMAhCAAAQg4BACCLpDHJXO2fziiww55ZRi2XnnATJ+fH+5445cCXSddyedEWE7BCAAAaFTHDeBrQnorHkTJ/Y3PfyDEgy2dvOfObNQbrmlQD76aK2ZEc/W2SdzEIAABJJGgBJ60lBzoZ4S0NXl9thjgHVaSMxb0/BYE+7Mnp3b0ySJDwEIQMC1BBB017rW+YZ9802GmUgnfN26Lgs7Z07rmu/OtxQLIAABCPSdAILed4akkCACtbWeqGPwa2qYaSdB6EkWAhBwIAEE3YFOS5csjx7dbJaQDW+ttqnvumtj+IPshQAEIJCGBBD0NHS6U0zOywvKmWdWh82utqnPnBnbQjVhE2AnBCAAAZcRoJe7yxzqNnN+//saq9p91qwCyc7Wnu4imZlBeeihChk2jCVh3eZv7IEABHpPAEHvPTvOTBKB6dNr5LTTamXZsgzJzQ3KT37SLH5/ki7OZSAAAQg4hACC7hBHpXs2tfp9l10iNKinOxzshwAEIGAI0IbObQABCEAAAhBwAQEE3QVOxAQIQAACEIAAgs49AAEIQAACEHABAQTdBU7EBAhAAAIQgACCzj0AAQhAAAIQcAEBBN0FTrSzCXfemSejRxebseMi229fJs8+m23n7JI3CEAAAo4lgKA71nX2z/jcuTly1VWFsnGj15rCtaLCK6eeWiL33ccqafb3HjmEAAScRiBp49Dr6+vl+eefl8WLF8vQoUPlt7/9rZSUlLTxevrpp+X111+Xfv36ycknn2x96sGKigp5/PHHZenSpTJu3Dg54YQTzMxhvIe0gbPplw0bPPL73xeHzd211xbI5Mm1Vqk9bAR2QgACEIBAjwkkTRnvv/9+eeedd2TatGnmhzxTLrjggrbMqpjr33HHHWdmAPPL+eefL4FA67KZM2fOlM2bNxsBmCwLFy6U2bNnt53HF/sSWLbML8XF4Zc+9ZhF0lau9Nk38+QMAhCAgAMJJK2E3tLSIueee64MGjTI+nvooYeksrJSCgsLzbrWc+Tyyy+XMWPGmBW0dpUTTzxR3n33XevYihUr5K9//at4jApceumlcsYZZ8gpp5wiPt8WQSgvL29Dn5GR4bgSvBtrHMrKgmJcHjZUV3tMDYyZ1cilNS1utSvkTH0WNWBniIizP9PJn2qrm+/bpAn6mWeead31K1eulLlz51rV5yrmzc3NsnbtWtNxanTbUzFq1ChRIS8tLbX2h2644cOHS11dnWmT3dhWJa8n7bPPPm3n7rDDDvLEE0+0bTvhy8CBA52QzR7lsaxMxLhLPvtMrAVVQierFgwa5DEd5AaEdrnu043+DOekdLEzLy8vnPmu25cu/lTdcWtImqArwKBZKuvqq682i2wsk7PPPtva1tK1lqqzsrLaGOfn58umTZtMR6omKSgoaNuvX0LHtK09FLRaPhS0XV7PdUrQH4uamhqnZLdH+TRdJoyoFxvfBo2PPaZWJWi2W+Tll6uNj3qUlGMiu9mfISfos5qTk+Oo5yyU9558ai2gNg9qIcLNITc316rxrKpy93LE2pyrhcPGxkbHurO4OHy/pJBBSRV0hfn3v//dahOfOnWqVfWu1ewq3NpmHqoKaWhosDrO6Q+Hfm8fdLuoqKj9LjnmmGM6bK9Zs6bDtp039Iex/Q/GHXfkyW235RuR98iQIS3y6KMbzGf4tmg726V5M+9p8u23dfLaa/lSXV1galw2y/jxdVaPd+NyV4bO/nSjkfqcpoOdoea79s+nG/2pLy3qU7fbqQVKp9vZnaAnpVOcCvYzzzxjVa/rA6GCrD3WP/30U+u7vjm1bwdfv369DB48WPr37y/6PRSqq6utNMq0PteFQYd5zZxZaEo+OszLY5odMmT33QeaHv5Jfe+KK1kdf37YYU2m74PIxIlNlsjH9QIkBgEIQAACFoGkCLoKtg5Ze+6556yLapv5W2+9JTvttJO1PXHiRHn44YdNJ6oWa3ja8uXLZezYsbLbbrvJqlWrZMmSJVYJft68ebL33nu3leTd5EOt1Qs3zMvjCcp113VsdnCT3dgCAQhAAALxIZC0op/2cL/ttttk/vz5Vpv56aefbqpfx1tWnHrqqXLxxRfLsccea7Vx6JC2UNXCjBkzrGPakUE7yWkbvBtDebnP9BcISFVVx3esYFBL6lt69LvRdmyCAAQgAIG+E0iaoG+33XZy6623GsGq6tLRTXtX3nfffVbvdRXyUK92NW/ChAmy7777mjbY6i5t53033z4p9O/fYjprtA4Hap8rLaH/5CcRxn+1j8h3CEAAAhBIawIdi4NJQNG513r7S2oP9fZiHjqmvU07d4QLHXPLZ7aZ4vzcc7v2MtUS+rXXbnaLmdgBAQhAAAIJIpB0QU+QHa5Idvr0Grnmms1SVtZiDfUaN65RFixYb0YDOLOXuyucghEQgAAEHEIgaVXuDuGR8myedFKt6F8ighm1IR9/7JfvvvOZ8eDNpuNhcyIuQ5oQgAAEIJACAgh6CqCn4pIq5r/+dal89JHfTCIhZtpdrwwb1mwWy1lvbaciT1wTAhCAAATiR4Aq9/ixtHVKhx9eJm++mWkmrPFaYq6ZXbXKJ7fckm/rfJM5CEAAAhCIjQCCHhsnR8cy0+WbsfyZZqrdjr3odXvWrPyIi6g42mgyDwEIQCDNCCDoaeDwqiqP1ckunKlaFa/TzBIgAAEIQMDZBBB0Z/svptwXFwelpCR8T3lddr6w0Kg6AQIQgAAEHE0AQXe0+2LLvC5ZevvtoeXNQuLd+rlgwZa15GNLjVgQgAAEIGBHAgi6Hb2SgDyNH98or7yy3syF3ygjRjSb2fcazYI55bLttgxdSwBukoQABCCQdAIMW0s68tYLake1c84pkvfe88vIkaXyr39VmFnyEpsZFe9HHqlI7EVIHQIQgAAEUkIAQU8JdjErzQ0ww8daF135/vsss5xsf3n//fVmJbkUZYjLQgACEICAowkgHylw37JlGW1iHrr8unU+WbTIH9rkEwIQgAAEINAjAgh6j3DFK3LQVK+HOqeF0vRQOg+h4BMCEIAABHpMAEHvMbK+n7DNNi0ydGjXJVHHj2/qe+KkAAEIQAACaUkAQU+R23UO9V13bTArqwVkr73q5auvfkh4p7gUmcplIQABCEAgCQToFJcEyOEuoQukPPNMhZSWlkpFxcZwUdgHAQhAAAIQiJkAJfSYURERAhCAAAQgYF8CCLp9fUPOIAABCEAAAjETQNBjRkVECEAAAhCAgH0JIOj29Q05gwAEIAABCMRMAEGPGRURIQABCEAAAvYlgKDb1zfkDAIQgAAEIBAzAQQ9ZlREhAAEIAABCNiXAIJuX9+QMwhAAAIQgEDMBBD0mFEREQIQgAAEIGBfAgi6fX1DziAAAQhAAAIxE0DQY0ZFRAhAAAIQgIB9CSDo9vUNOYMABCAAAQjETABBjxkVESEAAQhAAAL2JYCg29c35AwCEIAABCAQMwEEPWZURIQABCAAAQjYlwCCbl/fkDMIQAACEIBAzAQQ9JhRERECEIAABCBgXwIIun19Q84gAAEIQAACMRNA0GNGRUQIQAACEICAfQkg6Pb1DTmDAAQgAAEIxEwAQY8ZFREhAAEIQAAC9iWAoNvXN+QMAhCAAAQgEDMBBD1mVESEAAQgAAEI2JcAgm5f35AzCEAAAhCAQMwEMmKO6aCIWVlZjsmt1+sVJ+W3N2D9fr91WmZmpvh8vt4k4Zhz0sGfGRmtPxtuv2/1XtW/dLDT4/G43k79HXK7na4U9NAPjhNUQG8wJ+W3N0xDIq6faq+bQzr4U19aNLj9vlU708GfoWcSfzr/l8mVgl5TU+MYz+jbv5Py2xuwamNubq7U1dVJc3Nzb5JwzDnp4E91RnZ2tuvvWxU4FTu3P59qp768uN1OvWfVztraWsf8nnTOaGFhYeddHbZpQ++Agw0IQAACEICAMwm4soQeL1e89lqmLFqUKYWFQZkypdb6jFfapAMBCEAAAhCIJwEEPQLNSy4plLlzc6WpSSQzMyhXXVUob7yxTn7yk5YIZ7AbAhCAAAQgkDoCVLmHYf+f/2TJffflSUODRwIBj9TXt2I65pgyS+DDnMIuCEAAAhCAQEoJIOhh8L/wQrbZG+xypLLSI99+S6VGFzDsgAAEIACBlBNA0MO4oKSkxYw/7XqgsdEj+fmBrgfYAwEIQAACEEgxAQQ9jAOOPbbODFfpeMDnC5qhOkEZPBhB70iGLQhAAAIQsAMBBD2MF7bZpkUeeKDCOlJYGLBK5ePGNcmSJWvDxGYXBCAAAQhAIPUEaBCO4IP992+Uzz//QT791G+GqwVkzBh3T4gSAQO7IQABCEDAIQQQ9CiO0vHn48c3RonBIQhAAAIQgIA9CFDlbg8/kAsIQAACEIBAnwgg6H3Cx8kQgAAEIAABexBA0O3hB3IBAQhAAAIQ6BMBBL1P+DgZAhCAAAQgYA8CCLo9/EAuIAABCEAAAn0igKD3CR8nQwACEIAABOxBAEG3hx/IBQQgAAEIQKBPBBD0PuHjZAhAAAIQgIA9CCDo9vADuYAABCAAAQj0iQCC3id8nAwBCEAAAhCwBwEE3R5+IBcQgAAEIACBPhFA0PuEj5MhAAEIQAAC9iCAoNvDD+QCAhCAAAQg0CcCCHqf8HEyBCAAAQhAwB4EEHR7+IFcQAACEIAABPpEwBM0oU8pcDIEuiHw0UcfyU033SRXXnmljBgxopvYHLY7geeee04efvhhmT17tvh8Prtnl/x1Q+Cee+6RZcuWyfXXX99NTA7bnQAldLt7yAX527hxoyxevFhqampcYA0mrF692vJnIBAAhgsIqJh/8MEHLrAEExB07gEIQAACEICACwgg6C5wIiZAAAIQgAAEaEPnHkg4gebmZqu6PT8/nzbXhNNO/AUaGxulrq5OioqKEn8xrpBwAurLlpYW0eeT4GwCCLqz/UfuIQABCEAAAhYBqty5ESAAAQhAAAIuIJDhAhswwSYEysvL5eqrr5YbbrhBMjJab62Kigp5/PHHZenSpTJu3Dg54YQTxOttfY/85JNP5Omnn7aq44888kjZY489bGJJemejvr5e/u///k++/PJL2WWXXeSII46QkpISC0o0n0U7lt5EU2u9+uX5558Xbfo69NBDLZ+GchTNZ/psvv7669KvXz85+eSTrc/QeXzakwAldHv6xXG50ukMVMzfffddaT+1wcyZM2Xz5s0yefJkWbhwoTV2WY1bu3atXH755bLzzjvL+PHjrXO/+OILx9ntxgz/7//+r+hQwzPOOENWrVolt912m2VmNJ9FO+ZGRk6xacOGDXLRRRdZz9jEiRPlsssuk5UrV3brTxVz/TvuuOPE7/fL+eefLwxTtL/XEXT7+8gROXzkkUekrKysQ14///xzWbFihUyfPl123XVXufTSS63SunbAeeyxx0R/YA477DA5/PDDZdKkSdaxDgmwkXQCOib5u+++kxkzZsg222wj5513nuywww7WS1o0n0U7lnQjuGAbgTfeeEN23HFH2XfffWWvvfayasFefvll63g0n82ZM8fyvT63KuY6gZC+rBPsTQBBt7d/HJG7r7/+Wp599lk566yzOuRXS3ejR48Wj8dj7R8+fLjVO1pLf6FjoRM0ngoJIbUEtJZEhXzRokVW04n+iB999NGWD6P5LNqx1FqU3lfXZi59Pl944QVRIf/www/lv/7rvywokXymVfNa46LPZCiMGjXKejkPbfNpTwK0odvTL47JlQ5h0qp2rdbLzs7ukG/9USgoKOiwT4fGbNq0yfrBaH8stL9DZDaSTmDdunVWfwetRdlvv/1k7ty5oqW8P/zhD1F91tnX+DPprgt7wQEDBlgCfscdd1h9V7S0PnLkSCtuJJ9pXxjtA5OVldWWJv5sQ2HrL5TQbe0e+2fuH//4h4wdO1aGDBkilZWVVoa1zVzf8nNzc6WhoaGDEbqt45dzcnJEXwZCQTtiFRYWhjb5TBEBbS9Vv2jfB20KueKKK6ySnfonms+iHUuRKVzWENB52quqqqwmrkcffdR6wb755pstNpF8pvubmpo6tJnrc8vzaf9bCkG3v49sncNPP/1UXnrpJTnxxBPltNNOs/J6yimnyLfffiv9+/eX9evXt+W/urraEnpta9eSg5YGQ0HjDR48OLTJZ4oIqF+GDRvWNkqhtLTUaj9XX0XzWbRjKTKFyxoC2oRywAEHWP7UdvCDDjpI9JnVEMln+sKtL3ZaUg8Fns8QCXt/Iuj29o/tc6dVeU8++aT1N2/ePCu/WhLQ9rfddtvNaitfsmSJ9bavx/fee2+r6k9/ZLRdT4e1aYle2+C14w4htQTUP9oLWjs0atB2V61u3WqrrSxhiOQz/Jlav0W6unY8fe2116yXMm1G0Zdv3achms80jq6op+fokNPly5dbNXGRrsN+exCgDd0efnBlLrRNXXtLX3zxxVZ1nZb2tL1dgw5V0zGuU6ZMsapyVcwPPPBAV3JwklHar+GSSy6RP/7xj5aQ67Sg1157rdUpLprPoh1zkv1uy+vPfvYz+eabb+R3v/ud1fw1ZswYq5Oj2hnNZ6eeeqr13B577LGW7y+44AIpLi52Gx7X2cPUr65zqf0M0rd8rW4PN/d3bW2tNSSmfQcc+1mQfjnSuQR0NIK+hHUO0XwW7VjndNhOHoFQm3i45yyaz/QeUCEPjVRJXo65Um8IIOi9ocY5EIAABCAAAZsRoA3dZg4hOxCAAAQgAIHeEEDQe0ONcyAAAQhAAAI2I4Cg28whZAcCEIAABCDQGwIIem+ocQ4EIAABCEDAZgQQdJs5hOxAAAIQgAAEekMAQe8NNc6BQBoR0Jn9dLIgAgQgYG8CCLq9/UPuIJByAjoWuf28+ynPEBmAAATCEkDQw2JhJwQgEI5ATU1NuN1t+3QRF52UhgABCCSfAIKefOZcEQKOI/DJJ5/I7rvvbq3WpYvu6HSwoaDThJ533nly1FFHWbOK6SI7559/fofVukJx+YQABBJHAEFPHFtShoBrCNx0002WSC9btsxaWU/ne3/nnXcs+3R5zltvvVW22247a7GdWbNmiS7Ec+WVV7rGfgyBgBMIIOhO8BJ5hECKCfzP//yPTJ06VUaNGiWXX365ZGZmyscff9yWK50jXNdOz83NFV3QY/LkyaLCToAABJJHAEFPHmuuBAHHEthhhx3a8q4rsg0aNEg2bNjQtm/ChAnWqnmhHYcccohs2rRJvv3229AuPiEAgQQTQNATDJjkIeAGAjk5OVHN0DXT24eSkhJr0+fztd/NdwhAIIEEEPQEwiVpCKQLgZdeekl0mdxQ+OCDD0Q7z2211VahXXxCAAIJJoCgJxgwyUMgHQjoWPVLL73U6hQ3f/58ueqqq+Scc85JB9OxEQK2IYCg28YVZAQCziWw1157iZbSBwwYIDqMTTvGXXbZZc41iJxDwIEEMhyYZ7IMAQgkkUAgEOhytRUrVnTYp2PPH3vsMVm9erVV1e73+zscZwMCEEg8AQQ98Yy5AgTShsCQIUPSxlYMhYDdCFDlbjePkB8IQAACEIBALwh4zLzLTLzcC3CcAgEItBIILdyik80QIACB1BFA0FPHnitDAAIQgAAE4kaAKve4oSQhCEAAAhCAQOoIIOipY8+VIQABCEAAAnEjgKDHDSUJQQACEIAABFJHAEFPHXuuDAEIQAACEIgbAQQ9bihJCAIQgAAEIJA6Av8fldl6V6WbMosAAAAASUVORK5CYII=" style="height:50px;"></td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center">359225</td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center">168235</td>
      <td class="gt_row gt_center">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center">215196</td>
      <td class="gt_row gt_center">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center">170157</td>
      <td class="gt_row gt_center">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center">96076</td>
      <td class="gt_row gt_center">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center">9230</td>
      <td class="gt_row gt_center">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

---
count: false
 
# Demonstration: Adding figures
.panel1-ggplot-added-flip-user[

```r
gt_1 %>%
  text_transform(
    locations = cells_body(
      columns = vars(y_1995),
      rows = 3
    ),
    fn = function(x) {
      ggplot_image(g_ex, height = px(50))
    }
  ) %>%
* text_transform(
*   locations = cells_body(
*     columns = vars(y_1995),
*     rows = 4
*   ),
*   fn = function(x) {
*     local_image(
*       filename = "gt_gg.png",
*       height = px(50)
*     )
*   }
* )
```
]
 
.panel2-ggplot-added-flip-user[
<!--html_preserve--><style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#kwarzkdsee .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#kwarzkdsee .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kwarzkdsee .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#kwarzkdsee .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#kwarzkdsee .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kwarzkdsee .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#kwarzkdsee .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#kwarzkdsee .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#kwarzkdsee .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#kwarzkdsee .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#kwarzkdsee .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#kwarzkdsee .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#kwarzkdsee .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#kwarzkdsee .gt_from_md > :first-child {
  margin-top: 0;
}

#kwarzkdsee .gt_from_md > :last-child {
  margin-bottom: 0;
}

#kwarzkdsee .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#kwarzkdsee .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#kwarzkdsee .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kwarzkdsee .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#kwarzkdsee .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#kwarzkdsee .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#kwarzkdsee .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#kwarzkdsee .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#kwarzkdsee .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kwarzkdsee .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#kwarzkdsee .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#kwarzkdsee .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#kwarzkdsee .gt_left {
  text-align: left;
}

#kwarzkdsee .gt_center {
  text-align: center;
}

#kwarzkdsee .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#kwarzkdsee .gt_font_normal {
  font-weight: normal;
}

#kwarzkdsee .gt_font_bold {
  font-weight: bold;
}

#kwarzkdsee .gt_font_italic {
  font-style: italic;
}

#kwarzkdsee .gt_super {
  font-size: 65%;
}

#kwarzkdsee .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="kwarzkdsee" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="6" class="gt_heading gt_title gt_font_normal" style>Populations of Oceania's Countries in 1995, 2005, and 2015</th>
    </tr>
    <tr>
      <th colspan="6" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style><code>exibble</code> is an R dataset</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Country/Region</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">y_1995</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2">
        <span class="gt_column_spanner">2000s</span>
      </th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">pop_ratio_10_15</th>
      <th class="gt_col_heading gt_center gt_columns_bottom_border" rowspan="2" colspan="1">date</th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2005</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">y_2015<sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Australasia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Australia</td>
      <td class="gt_row gt_center">18072000</td>
      <td class="gt_row gt_center">20394800</td>
      <td class="gt_row gt_center">23850784</td>
      <td class="gt_row gt_right">1.169454</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Zealand</td>
      <td class="gt_row gt_center">3673400</td>
      <td class="gt_row gt_center">4133900</td>
      <td class="gt_row gt_center">4595700</td>
      <td class="gt_row gt_right">1.111710</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Melanesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Papua New Guinea</td>
      <td class="gt_row gt_center"><img cid="emzgirtnjxko__temp_ggplot.png" src="data:image/png;base64,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AQj0iQCC3id8nAwBCEAAAhCwBwEE3R5+IBcQgAAEIACBPhFA0PuEj5MhAAEIQAAC9iCAoNvDD+QCAhCAAAQg0CcCCHqf8HEyBCAAAQhAwB4EEHR7+IFcQAACEIAABPpEwBM0oU8pcDIEuiHw0UcfyU033SRXXnmljBgxopvYHLY7geeee04efvhhmT17tvh8Prtnl/x1Q+Cee+6RZcuWyfXXX99NTA7bnQAldLt7yAX527hxoyxevFhqampcYA0mrF692vJnIBAAhgsIqJh/8MEHLrAEExB07gEIQAACEICACwgg6C5wIiZAAAIQgAAEaEPnHkg4gebmZqu6PT8/nzbXhNNO/AUaGxulrq5OioqKEn8xrpBwAurLlpYW0eeT4GwCCLqz/UfuIQABCEAAAhYBqty5ESAAAQhAAAIuIJDhAhswwSYEysvL5eqrr5YbbrhBMjJab62Kigp5/PHHZenSpTJu3Dg54YQTxOttfY/85JNP5Omnn7aq44888kjZY489bGJJemejvr5e/u///k++/PJL2WWXXeSII46QkpISC0o0n0U7lt5EU2u9+uX5558Xbfo69NBDLZ+GchTNZ/psvv7669KvXz85+eSTrc/QeXzakwAldHv6xXG50ukMVMzfffddaT+1wcyZM2Xz5s0yefJkWbhwoTV2WY1bu3atXH755bLzzjvL+PHjrXO/+OILx9ntxgz/7//+r+hQwzPOOENWrVolt912m2VmNJ9FO+ZGRk6xacOGDXLRRRdZz9jEiRPlsssuk5UrV3brTxVz/TvuuOPE7/fL+eefLwxTtL/XEXT7+8gROXzkkUekrKysQ14///xzWbFihUyfPl123XVXufTSS63SunbAeeyxx0R/YA477DA5/PDDZdKkSdaxDgmwkXQCOib5u+++kxkzZsg222wj5513nuywww7WS1o0n0U7lnQjuGAbgTfeeEN23HFH2XfffWWvvfayasFefvll63g0n82ZM8fyvT63KuY6gZC+rBPsTQBBt7d/HJG7r7/+Wp599lk566yzOuRXS3ejR48Wj8dj7R8+fLjVO1pLf6FjoRM0ngoJIbUEtJZEhXzRokVW04n+iB999NGWD6P5LNqx1FqU3lfXZi59Pl944QVRIf/www/lv/7rvywokXymVfNa46LPZCiMGjXKejkPbfNpTwK0odvTL47JlQ5h0qp2rdbLzs7ukG/9USgoKOiwT4fGbNq0yfrBaH8stL9DZDaSTmDdunVWfwetRdlvv/1k7ty5oqW8P/zhD1F91tnX+DPprgt7wQEDBlgCfscdd1h9V7S0PnLkSCtuJJ9pXxjtA5OVldWWJv5sQ2HrL5TQbe0e+2fuH//4h4wdO1aGDBkilZWVVoa1zVzf8nNzc6WhoaGDEbqt45dzcnJEXwZCQTtiFRYWhjb5TBEBbS9Vv2jfB20KueKKK6ySnfonms+iHUuRKVzWENB52quqqqwmrkcffdR6wb755pstNpF8pvubmpo6tJnrc8vzaf9bCkG3v49sncNPP/1UXnrpJTnxxBPltNNOs/J6yimnyLfffiv9+/eX9evXt+W/urraEnpta9eSg5YGQ0HjDR48OLTJZ4oIqF+GDRvWNkqhtLTUaj9XX0XzWbRjKTKFyxoC2oRywAEHWP7UdvCDDjpI9JnVEMln+sKtL3ZaUg8Fns8QCXt/Iuj29o/tc6dVeU8++aT1N2/ePCu/WhLQ9rfddtvNaitfsmSJ9bavx/fee2+r6k9/ZLRdT4e1aYle2+C14w4htQTUP9oLWjs0atB2V61u3WqrrSxhiOQz/Jlav0W6unY8fe2116yXMm1G0Zdv3achms80jq6op+fokNPly5dbNXGRrsN+exCgDd0efnBlLrRNXXtLX3zxxVZ1nZb2tL1dgw5V0zGuU6ZMsapyVcwPPPBAV3JwklHar+GSSy6RP/7xj5aQ67Sg1157rdUpLprPoh1zkv1uy+vPfvYz+eabb+R3v/ud1fw1ZswYq5Oj2hnNZ6eeeqr13B577LGW7y+44AIpLi52Gx7X2cPUr65zqf0M0rd8rW4PN/d3bW2tNSSmfQcc+1mQfjnSuQR0NIK+hHUO0XwW7VjndNhOHoFQm3i45yyaz/QeUCEPjVRJXo65Um8IIOi9ocY5EIAABCAAAZsRoA3dZg4hOxCAAAQgAIHeEEDQe0ONcyAAAQhAAAI2I4Cg28whZAcCEIAABCDQGwIIem+ocQ4EIAABCEDAZgQQdJs5hOxAAAIQgAAEekMAQe8NNc6BQBoR0Jn9dLIgAgQgYG8CCLq9/UPuIJByAjoWuf28+ynPEBmAAATCEkDQw2JhJwQgEI5ATU1NuN1t+3QRF52UhgABCCSfAIKefOZcEQKOI/DJJ5/I7rvvbq3WpYvu6HSwoaDThJ533nly1FFHWbOK6SI7559/fofVukJx+YQABBJHAEFPHFtShoBrCNx0002WSC9btsxaWU/ne3/nnXcs+3R5zltvvVW22247a7GdWbNmiS7Ec+WVV7rGfgyBgBMIIOhO8BJ5hECKCfzP//yPTJ06VUaNGiWXX365ZGZmyscff9yWK50jXNdOz83NFV3QY/LkyaLCToAABJJHAEFPHmuuBAHHEthhhx3a8q4rsg0aNEg2bNjQtm/ChAnWqnmhHYcccohs2rRJvv3229AuPiEAgQQTQNATDJjkIeAGAjk5OVHN0DXT24eSkhJr0+fztd/NdwhAIIEEEPQEwiVpCKQLgZdeekl0mdxQ+OCDD0Q7z2211VahXXxCAAIJJoCgJxgwyUMgHQjoWPVLL73U6hQ3f/58ueqqq+Scc85JB9OxEQK2IYCg28YVZAQCziWw1157iZbSBwwYIDqMTTvGXXbZZc41iJxDwIEEMhyYZ7IMAQgkkUAgEOhytRUrVnTYp2PPH3vsMVm9erVV1e73+zscZwMCEEg8AQQ98Yy5AgTShsCQIUPSxlYMhYDdCFDlbjePkB8IQAACEIBALwh4zLzLTLzcC3CcAgEItBIILdyik80QIACB1BFA0FPHnitDAAIQgAAE4kaAKve4oSQhCEAAAhCAQOoIIOipY8+VIQABCEAAAnEjgKDHDSUJQQACEIAABFJHAEFPHXuuDAEIQAACEIgbAQQ9bihJCAIQgAAEIJA6Av8fldl6V6WbMosAAAAASUVORK5CYII=" style="height:50px;"></td>
      <td class="gt_row gt_center">6314709</td>
      <td class="gt_row gt_center">7919825</td>
      <td class="gt_row gt_right">1.254187</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Solomon Islands</td>
      <td class="gt_row gt_center"><img cid="empqgrjkafno__gt_gg.png" src="data:image/png;base64,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dZ459ShJSUls2rSJLl26sHLlyhqhDPb29pw7d4709HScnJy4ffs2aWlptG3bVkNPayM1NZXt27djYGDAlClTgP/TcX19fQYPHlzjXKQn5XHK7NKli0YcTGlpKfn5+Tg6OtK5c+cGlfXYxsurr77Kjh07pN09PXr0oKioiD179gDVAVDnzp0DYP/+/aSkpHDgwAFKS0u5detWnYdu1cVLL73ESy+9RGJiIjNnzqRnz57s37+fe/fu8d5770lLSb/++isREREkJydLxlNCQsJz3TkieDzUOtG1a1eN615eXnzzzTd899133Lt3j+LiYhITE2nfvr3OMwcMDQ3p2bMnv/76K/7+/nh4eHDo0CHu3r0rGcHant2YqKuOf/3rXwkNDSU4OBhfX1/S0tLIzMzE19cXExMTren6+vr88MMPQHX82cNnaDg4ODBkyBBsbGzYunUrCoUCExMTtm3bRvPmzaVlpReNnZ2d1jrevn2bhIQEpk+fzhtvvMG9e/fYu3cvFhYWUjCjQqEgPz8fFxcXjReFLv3R9WyBbmbNmkVMTAxr166t11ivq6+geufgr7/+yuTJkxk9erRkDAwYMEAydo4ePcrEiRPx8fEhNTWVS5cu0atXL2xtbenbty+nT59m9uzZuLm5Se+z1157jb/97W8az9qyZQsZGRnMmTOnXl429fkujo6OREZGaqSNGzeOV199lXPnzjFr1ix69epFWloaZWVlGt6lunB3d8fQ0JAdO3aQlZWFk5MT+/fvB2hUh8Y+avD8/vvvxMXF4evry5gxYxpU1mMbL926dWP58uWsXLmSH374QZoALSwsmDx5MqNGjaJr16788ssvHD58mLKyMjp27MjLL7/MxYsXJbffw5iZmSGXy2sES5qYmCCTyVi+fDkLFy7k1KlTnDx5EiMjI9555x0+/vhjVCoVvXv35pdffuHixYuYmpri7e1NYmIi27ZtE8ZLI6O24LPbt29jampaI4jLxsaGhQsXsnTpUnbu3AlUf6Wod5rpKn/BggXMnz+fmJgYTp8+jVKp5K233tKIcq/r2S+Khspn2rRp7N69m/DwcCorKxk4cKC0G0Zbel5ennRy7MaNGzXKfe211xgyZAjTpk1j9erV7N27F6VSiZ2dHcuWLXuhy2uPykdbHceMGcONGzfYu3ev5D3p1KkTc+fOlZaD1Ke2durUqcaz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" style="height:50px;"></td>
      <td class="gt_row gt_center">469885</td>
      <td class="gt_row gt_center">587482</td>
      <td class="gt_row gt_right">1.250268</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">New Caledonia</td>
      <td class="gt_row gt_center">193816</td>
      <td class="gt_row gt_center">232250</td>
      <td class="gt_row gt_center">272400</td>
      <td class="gt_row gt_right">1.172874</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Vanuatu</td>
      <td class="gt_row gt_center">168235</td>
      <td class="gt_row gt_center">209370</td>
      <td class="gt_row gt_center">264603</td>
      <td class="gt_row gt_right">1.263806</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr class="gt_group_heading_row">
      <td colspan="6" class="gt_group_heading">Polynesia</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">French Polynesia</td>
      <td class="gt_row gt_center">215196</td>
      <td class="gt_row gt_center">254886</td>
      <td class="gt_row gt_center">277690</td>
      <td class="gt_row gt_right">1.089467</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Samoa</td>
      <td class="gt_row gt_center">170157</td>
      <td class="gt_row gt_center">179929</td>
      <td class="gt_row gt_center">193759</td>
      <td class="gt_row gt_right">1.076864</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tonga</td>
      <td class="gt_row gt_center">96076</td>
      <td class="gt_row gt_center">101041</td>
      <td class="gt_row gt_center">106364</td>
      <td class="gt_row gt_right">1.052682</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
    <tr>
      <td class="gt_row gt_left gt_stub">Tuvalu</td>
      <td class="gt_row gt_center">9230</td>
      <td class="gt_row gt_center">10027</td>
      <td class="gt_row gt_center">11001</td>
      <td class="gt_row gt_right">1.097138</td>
      <td class="gt_row gt_left">2013-11-14</td>
    </tr>
  </tbody>
  <tfoot class="gt_sourcenotes">
    <tr>
      <td class="gt_sourcenote" colspan="6">From the <code>gt</code> package</td>
    </tr>
  </tfoot>
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="6">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          This is the last year
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table></div><!--/html_preserve-->
]

<style>
.panel1-ggplot-added-flip-user {
  color: black;
  width: 49%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel2-ggplot-added-flip-user {
  color: black;
  width: 49%;
  hight: 32%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
.panel3-ggplot-added-flip-user {
  color: black;
  width: NA%;
  hight: 33%;
  float: left;
  padding-left: 1%;
  font-size: 80%
}
</style>



---

# Save


```r
gtsave(gt_4, "gt4.html") 
```


```r
gtsave(gt_4, "gt4.tex") 
```


```r
gtsave(gt_4, "LectureNotes/Chapter-6-MakeTable/gt4.pdf", zoom = 0.9, vwidth = 800) 
```

