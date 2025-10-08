set_test_name()

beginning_of_test(85)
    begin_test
      --
      set_paired_outputs_on
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_acc_pair(0, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_extnd_too_short_acc
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_extnd_acc(2043, 19)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(2043), EN high,
                                                low_byte(2043), EN low,
                                                            19, Data)
      --
end_of_test
