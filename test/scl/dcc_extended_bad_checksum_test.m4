set_test_name()

beginning_of_test(94)
    begin_test
      --
      set_paired_outputs_on
      set_rcn213_linear_addressing_off
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_extnd_acc(0, 1)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high, 0, EN low, 1, Data)
      --
      input_dcc_extnd_bad_checksum_acc
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc_pair(2043, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2043), EN high,
                                               low_byte(2043), EN low)
      --
end_of_test
