set_test_name()

beginning_of_test(881)
    begin_test
      --
      set_paired_outputs_on
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_acc_pair(0, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair(0, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair(1, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(1, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_basic_acc_pair(251, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(251), EN high,
                                               low_byte(251), EN low)
      --
      input_dcc_basic_acc_pair(251, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(251), EN high,
                                               low_byte(251), EN low)
      --
      input_dcc_basic_acc_pair(252, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(252), EN high,
                                               low_byte(252), EN low)
      --
      input_dcc_basic_acc_pair(252, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(252), EN high,
                                               low_byte(252), EN low)
      --
      input_dcc_basic_acc_pair(507, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(507), EN high,
                                               low_byte(507), EN low)
      --
      input_dcc_basic_acc_pair(507, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(507), EN high,
                                               low_byte(507), EN low)
      --
      input_dcc_basic_acc_pair(508, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(508), EN high,
                                               low_byte(508), EN low)
      --
      input_dcc_basic_acc_pair(508, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(508), EN high,
                                               low_byte(508), EN low)
      --
      log(Individual 510 Deactivation ignored)
      input_dcc_basic_acc(510, Deactivate)
      can_tx_check_for_no_message(1, DCC event)
      --
      log(Individual 510 Activation translated as pair 255 Deactivation)
      input_dcc_basic_acc(510, Activate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(255), EN high,
                                               low_byte(255), EN low)
      --
      log(Individual 511 Deactivation ignored)
      input_dcc_basic_acc(511, Deactivate)
      can_tx_check_for_no_message(1, DCC event)
      --
      log(Individual 511 Activation translated as pair 255 Activation)
      input_dcc_basic_acc(511, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(255), EN high,
                                               low_byte(255), EN low)
      --
      input_dcc_basic_acc_pair(1019, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1019), EN high,
                                               low_byte(1019), EN low)
      --
      input_dcc_basic_acc_pair(1019, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1019), EN high,
                                               low_byte(1019), EN low)
      --
      input_dcc_basic_acc_pair(1020, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1020), EN high,
                                               low_byte(1020), EN low)
      --
      input_dcc_basic_acc_pair(1020, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1020), EN high,
                                               low_byte(1020), EN low)
      --
      input_dcc_basic_acc_pair(2042, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2042), EN high,
                                               low_byte(2042), EN low)
      --
      input_dcc_basic_acc_pair(2042, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2042), EN high,
                                               low_byte(2042), EN low)
      --
      input_dcc_basic_acc_pair(2043, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2043), EN high,
                                               low_byte(2043), EN low)
      --
      input_dcc_basic_acc_pair(2043, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2043), EN high,
                                               low_byte(2043), EN low)
      --
      input_dcc_basic_acc_pair(6, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(6), EN high,
                                               low_byte(6), EN low)
      --
      input_dcc_basic_acc_pair(7, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(7), EN high,
                                               low_byte(7), EN low)
      --
      input_dcc_basic_acc_pair(8, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(8), EN high,
                                               low_byte(8), EN low)
      --
      input_dcc_basic_acc_pair(9, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(9), EN high,
                                               low_byte(9), EN low)
      --
      input_dcc_basic_acc_pair(10, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(10), EN high,
                                               low_byte(10), EN low)
      --
      input_dcc_basic_acc_pair(11, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(11), EN high,
                                               low_byte(11), EN low)
      --
      input_dcc_basic_acc_pair(12, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(12), EN high,
                                               low_byte(12), EN low)
      --
      input_dcc_basic_acc_pair(13, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(13), EN high,
                                               low_byte(13), EN low)
      --
      input_dcc_basic_acc_pair(14, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(14), EN high,
                                               low_byte(14), EN low)
      --
      input_dcc_basic_acc_pair(15, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(15), EN high,
                                               low_byte(15), EN low)
      --
      input_dcc_basic_acc_pair(16, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(16), EN high,
                                               low_byte(16), EN low)
      --
      input_dcc_basic_acc_pair(17, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(17), EN high,
                                               low_byte(17), EN low)
      --
      input_dcc_basic_acc_pair(18, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(18), EN high,
                                               low_byte(18), EN low)
      --
end_of_test
