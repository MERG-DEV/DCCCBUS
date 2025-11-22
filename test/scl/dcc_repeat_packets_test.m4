set_test_name()

beginning_of_test(696)
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
      input_dcc_basic_acc_pair(0, Deactivate)
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc_pair(0, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair(0, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair(0, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair(0, Activate)
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc_pair(0, Activate)
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc_pair(0, Activate)
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc_pair(0, Activate)
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc_pair(1, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(0, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
      --
      log(Individual 510 Activation translated as pair 255 Deactivation)
      input_dcc_basic_acc(510, Activate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(255), EN high,
                                               low_byte(255), EN low)
      --
      log(Individual 510 Activation repeat ignored)
      input_dcc_basic_acc(510, Activate)
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc_pair(1019, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1019), EN high,
                                               low_byte(1019), EN low)
      --
      log(Individual 510 Activation translated as pair 255 Deactivation)
      input_dcc_basic_acc(510, Activate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(255), EN high,
                                               low_byte(255), EN low)
      --
      input_dcc_extnd_acc(0, 42)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high, 0, EN low, 42, Data)
      --
      input_dcc_extnd_acc(0, 42)
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_extnd_acc(1, 33)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high, 1, EN low, 33, Data)
      --
      input_dcc_extnd_acc(0, 42)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high, 0, EN low, 42, Data)
      --
      input_dcc_extnd_acc(0, 42)
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc_pair(0, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_extnd_acc(0, 42)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high, 0, EN low, 42, Data)
      --
      input_dcc_basic_acc_pair(1, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(1, Deactivate)
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_extnd_acc(0, 42)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high, 0, EN low, 42, Data)
      --
      input_dcc_basic_acc_pair(1, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
      --
end_of_test
