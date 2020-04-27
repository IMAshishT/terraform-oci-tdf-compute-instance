# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


locals {
  comp_instances = {
          PTL_01 = {
              ad                          = 0                                                                                  #0-AD1, 1-AD2, 3-AD3 Required
              compartment_id              = null #"ocid1.xxxxx" #Optional if var.default_compartment_id set
              shape                       = "VM.Standard2.1"                                                                      #Required
              subnet_id                   = "ocid1.subnet.oc2.us-langley-1.aaaaaaaao5vibt2erizz742q3huwnsqecc7mkrztdnhxu2rtbfpddd3mzwla"   #Required
              assign_public_ip            = false
              fault_domain                = "FAULT-DOMAIN-1"

              ssh_authorized_keys         = ["../../keys/publicKey.pub"]     #ex: ["/path/public-key.pub"]
              ssh_private_keys            = ["../../keys/sshKey"]    #ex: ["/path/private-key"]
              bastion_ip                  = "139.87.70.194"
              user_data                   = base64encode(file("bootstrap.sh"))

              image_name                  = "Oracle-Linux-7.7-2020.03.23-0" #Required
              source_id                   = "ocid1.image.oc2.us-langley-1.aaaaaaaanpy5qap45zeroc7u5unxcn6cbkea5bymx4ubbqmk4psqqe27moeq" #"ocid1.xxxxx"  #Required
              
              boot_vol_size_gbs           = "50"
              
              mount_blk_vols              = true
              block_volumes               = [{
                                              volume_id        = "ocid1.volume.oc2.us-langley-1.abwgmljrenmh52pkovllemk2naiehl7whhe3b2xki4cy4vcmyzzxtfbvmbza",
                                              attachment_type  = "iscsi",
                                              volume_mount_dir = "/u01"
                                            }]

              is_monitoring_disabled      = null

              
              vnic_defined_tags           = null
              vnic_display_name           = null
              vnic_freeform_tags          = null
              nsg_ids                     = null  
              private_ip                  = null
              skip_src_dest_check         = null

              defined_tags                = null
              display_name                = null
              extended_metadata           = null

              freeform_tags               = null
              hostname_label              = null
              ipxe_script                 = null
              pv_encr_trans_enabled       = null

              
              bastion_ip                  = null
              

              
              source_type                 = null
              
              kms_key_id                  = null

              preserve_boot_volume        = null
              instance_timeout            = null
              sec_vnics                   = null
              
              cons_conn_create            = null
              cons_conn_def_tags          = null
              cons_conn_free_tags         = null
              mkp_image_name              = null
              mkp_image_name_version      = null
          }, 
          "inst2-Apache" = {
              ad                          = 0                                                                                  #0-AD1, 1-AD2, 3-AD3 Required
              compartment_id              = null #"ocid1.xxxxx" #Optional if var.default_compartment_id set
              shape                       = "VM.Standard2.1"                                                                      #Required
              subnet_id                   = "ocid1.subnet.oc2.us-langley-1.aaaaaaaao5vibt2erizz742q3huwnsqecc7mkrztdnhxu2rtbfpddd3mzwla"   #Required
              assign_public_ip            = false
              fault_domain                = "FAULT-DOMAIN-1"

              ssh_authorized_keys         = ["../../keys/publicKey.pub"]     #ex: ["/path/public-key.pub"]
              ssh_private_keys            = ["../../keys/sshKey"]    #ex: ["/path/private-key"]
              bastion_ip                  = null
              user_data                   = base64encode(file("bootstrap.sh"))

              image_name                  = "Oracle-Linux-7.7-2020.03.23-0" #Required
              source_id                   = "ocid1.image.oc2.us-langley-1.aaaaaaaanpy5qap45zeroc7u5unxcn6cbkea5bymx4ubbqmk4psqqe27moeq" #"ocid1.xxxxx"  #Required
              
              boot_vol_size_gbs           = "50"
              mount_blk_vols              = true
              block_volumes               = [{
                                              volume_id        = "ocid1.volume.oc2.us-langley-1.abwgmljrafi7po73phwgxpg7kdjsnplz75ipypstbbncmwekqknqslfcudla",
                                              attachment_type  = "iscsi",
                                              volume_mount_dir = "/u01"
                                            }]
              is_monitoring_disabled              = null
              vnic_defined_tags                   = null
              vnic_display_name                   = null
              vnic_freeform_tags                  = null
              nsg_ids                             = null
              private_ip                          = null
              skip_src_dest_check                 = null
              defined_tags                        = null
              extended_metadata                   = null
              freeform_tags                       = null
              hostname_label                      = null
              ipxe_script                         = null
              pv_encr_trans_enabled               = null
              source_type                         = null
              kms_key_id                          = null
              preserve_boot_volume                = null
              instance_timeout                    = null
              sec_vnics                           = null
              cons_conn_create                    = null
              cons_conn_def_tags                  = null
              cons_conn_free_tags                 = null
              mkp_image_name                      = null
              mkp_image_name_version              = null
          }
  }
}


module "oci_instances" {
  source                  = "../../"
  
  default_compartment_id  = var.default_compartment_id
  instances               = local.comp_instances

}