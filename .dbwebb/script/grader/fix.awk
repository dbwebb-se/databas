#!/usr/bin/env awk

BEGIN {
  FS="\n"
  total = 0
  
  while ((getline temp < "teachers.data") > 0) {
    gsub(/^ | $/, "", temp)
    kmoms[temp][0] = 0
    kmoms[temp][1] = 0
    kmoms[temp][2] = 0
    kmoms[temp][3] = 0
    kmoms[temp][4] = 0
    kmoms[temp][5] = 0
    kmoms[temp][6] = 0
  }
}

{
  
  if (NR%2==0) {
    gsub(/"/, "", $1)
    gsub(/"/, "", prev)
    
    if (prev == "Kmom01") {
      kmoms[$1][0]++
    } else if (prev == "Kmom02") {
      kmoms[$1][1]++
    } else if (prev == "Kmom03") {
      kmoms[$1][2]++
    } else if (prev == "Kmom04") {
      kmoms[$1][3]++
    } else if (prev == "Kmom05") {
      kmoms[$1][4]++
    } else if (prev == "Kmom06") {
      kmoms[$1][5]++
    } else if (prev == "Kmom10 Projekt och examination") {
      kmoms[$1][6]++
    }

    
    
  }
  prev=$0
  
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
  all=0
  printf ("%-25s%s%-8s%-8s%-8s%-8s%-8s%-8s%-8s%s%-8s\n", "Name", "|", "Kmom01", "Kmom02", "Kmom03", "Kmom04", "Kmom05", "Kmom06", "Kmom10", "|", "Totalt")
  printf ("%s\n", "-----------------------------------------------------------------------------------------")
  for (name in kmoms) {
    total1+=kmoms[name][0]
    total2+=kmoms[name][1]
    total3+=kmoms[name][2]
    total4+=kmoms[name][3]
    total5+=kmoms[name][4]
    total6+=kmoms[name][5]
    total7+=kmoms[name][6]
    total=kmoms[name][0]+kmoms[name][1]+kmoms[name][2]+kmoms[name][3]+kmoms[name][4]+kmoms[name][5]+kmoms[name][6]
    printf ("%-25s%s%-8s%-8s%-8s%-8s%-8s%-8s%-8s%s%-8s\n", name, "|", kmoms[name][0], kmoms[name][1], kmoms[name][2], kmoms[name][3], kmoms[name][4], kmoms[name][5], kmoms[name][6], "|", total)
  
  } 
  printf ("%s\n", "-----------------------------------------------------------------------------------------")
  printf ("%-25s%s%-8s%-8s%-8s%-8s%-8s%-8s%-8s%s%-8s\n", "Totalt", "|", total1, total2, total3, total4, total5, total6, total7, "|", total1+total2+total3+total4+total5+total6+total7)
}