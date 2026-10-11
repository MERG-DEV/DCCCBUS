set_test_name()

beginning_of_test(103)
    begin_test
      --
      set_paired_outputs_on
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_extnd_acc(2043, 7)
      can_tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(2043), EN high,
                                                low_byte(2043), EN low, 7, Data)
      --
      input_dcc_extnd_overrun_slot_acc
      can_tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc_pair(2043, Dectivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2043), EN high,
                                               low_byte(2043), EN low)
      --
end_of_test
