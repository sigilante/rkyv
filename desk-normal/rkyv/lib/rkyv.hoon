/-  *rkyv
|%
++  find-by-value
  |=  [=store =cord]
  ^-  (set (pair key value))
  =|  result=(set (pair key value))
  =/  values  ~(tap by store)
  |-
  ?~  values  result
  =/  key     -:i.values
  =/  search  (find-in-txt +:i.values cord)
  ?~  search
    $(values t.values, result (~(put in result) [key (need search)]))
  $(values t.values)
++  find-in-txt
  |=  [=value =cord]
  ^-  cursor
  ?-    -.value
      %txt
    =/  nedl=tape  (trip cord)
    =/  hstk=tape  (trip body.value)
    `cursor`(find nedl hstk)
  ::
      %yaml
    =/  nedl=tape  (trip cord)
    =/  hstk=tape  (trip body.value)
    `cursor`(find nedl hstk)
  ::
      %xml
    *cursor
  ::
      %json
    *cursor
  ==
--
