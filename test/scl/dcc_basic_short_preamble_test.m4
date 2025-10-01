set_test_name()

beginning_of_test(98)
    begin_test
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_short_preamble_acc(9)
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc_pair(0, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      log(End bit of previous packet counted as preamble for next packet)
      input_dcc_basic_short_preamble_acc(8)
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc_pair(2043, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2043), EN high,
                                               low_byte(2043), EN low)
      --
end_of_test
