#!/usr/bin/env awk

BEGIN {
  FS=","
  total = 0

  
}

{
  #print $0

    gsub(/"/, "", $1)
    gsub(/"/, "", $2)
    gsub(/"/, "", $3)

    kmoms[$2][$3]++

    if ($1 == "Kmom01") {
      kmoms[$2][0]++
    } else if ($1 == "Kmom02") {
      kmoms[$2][1]++
    } else if ($1 == "Kmom03") {
      kmoms[$2][2]++
    } else if ($1 == "Kmom04") {
      kmoms[$2][3]++
    } else if ($1 == "Kmom05") {
      kmoms[$2][4]++
    } else if ($1 == "Kmom06") {
      kmoms[$2][5]++
    } else if ($1 == "Kmom10 Projekt och examination") {
      kmoms[$2][6]++
    }
}

END {
  total=0
  total1=0
  total2=0
  total3=0
  total4=0
  total5=0
  total6=0
  total7=0
  teachertotal=0

  all=0
  printf ("%-20s%s%8s%8s%8s%8s%8s%8s%8s%s%8s%7s%6s%7s\n", "Name", "|", "Kmom01", "Kmom02", "Kmom03", "Kmom04", "Kmom05", "Kmom06", "Kmom10", "|", "Totalt", "%", "G", "%G")
  printf ("%s\n", "--------------------------------------------------------------------------------------------------------------")
  for (name in kmoms) {
    total1+=kmoms[name][0]
    total2+=kmoms[name][1]
    total3+=kmoms[name][2]
    total4+=kmoms[name][3]
    total5+=kmoms[name][4]
    total6+=kmoms[name][5]
    total7+=kmoms[name][6]
    kmoms[name][7]+=kmoms[name]["0"]+kmoms[name][1]+kmoms[name][2]+kmoms[name][3]+kmoms[name][4]+kmoms[name][5]+kmoms[name][6]

  }

  alltotal = total1+total2+total3+total4+total5+total6+total7
  alltotal_g = 0

  for (name in kmoms) {
    alltotal_g += kmoms[name]["G"]
    tot_percentage = 0

    amountG = 0
    g_percentage = 0
    if (kmoms[name][7] > 0) {
      tot_percentage = (kmoms[name][7] / alltotal)*100
    }
    if (kmoms[name]["G"] > 0) {
      amountG = kmoms[name]["G"]
      g_percentage = (kmoms[name]["G"] / kmoms[name][7])*100
    }
    printf ("%-20s%s%8s%8s%8s%8s%8s%8s%8s%s%8s%6.0f%%%6s%6.0f%%\n", name, "|", kmoms[name][0], kmoms[name][1], kmoms[name][2], kmoms[name][3], kmoms[name][4], kmoms[name][5], kmoms[name][6], "|", kmoms[name][7], tot_percentage, amountG, g_percentage)

  }
    alltotal_g_percentage = (alltotal_g / alltotal)*100
    printf ("%s\n", "---------------------------------------------------------------------------------------------------------------")

    printf ("%-20s%s%8s%8s%8s%8s%8s%8s%8s%s%8s%6.0f%%%6s%6.0f%%\n", "Totalt", "|", total1, total2, total3, total4, total5, total6, total7, "|", alltotal, 100.00, alltotal_g, alltotal_g_percentage)
    printf ("%s\n", "---------------------------------------------------------------------------------------------------------------")
    printf ("%-20s%s%7.0f%%%7.0f%%%7.0f%%%7.0f%%%7.0f%%%7.0f%%%7.0f%%\n", "Genomströmming", "|", (total1/total1*100), (total2/total1*100), (total3/total1*100), (total4/total1*100), (total5/total1*100), (total6/total1*100), (total7/total1*100))

}
