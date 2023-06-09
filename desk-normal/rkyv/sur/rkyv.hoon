|%
+$  key  @tas
+$  value
  $%  [%xml body=manx]
      [%json body=json]
      [%yaml body=@t]
      [%txt body=@t]
  ==
+$  store  (map key value)
+$  cursor  (unit @ud)
+$  action
  $%  [%create =key =value]
      [%retrieve =key]
      [%update =key =value]
      [%destroy =key]
  ==
+$  batch
  $%  [%create-many =(list (pair key value))]
      [%retrieve-by-head =term]
      [%retrieve-by-value =cord]
      [%update-many =(list (pair key value))]
  ==
+$  result
  $%  [%store =store]
      [%value =value]
      [%delete =key]
      [%answer =(set key)]
      [%values =(set (pair key value))]
  ==
--
