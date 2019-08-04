<template>
<v-card class="mx-auto pa-5"
    outlined>
         <v-list-item-content class="mx-5 mb-5">
        <div class="overline mb-4">DIGITAL TWIN PANEL</div>
        <v-list-item-title class="display-1 mb-1">Create a new Digital Twin asset &#10024;</v-list-item-title>
        <v-list-item-subtitle class="subtitle-1" gray--text>Register your Digital Twin through this panel </v-list-item-subtitle>
      </v-list-item-content>
    
  <v-form v-model="valid" enctype="multipart/form-data">
    <v-container grid-list-lg>
      <v-layout wrap>
        <v-flex
          xs12
          md6
        >
          <v-text-field
            v-model="name"
            :rules="nameRules"
            :counter="30"
            label="Twin Name"
            required
          ></v-text-field>
        </v-flex>

        <v-flex
          xs12
          md6
        >
          <v-text-field
            v-model="description"
            :rules="descRules"
            :counter="150"
            label="Twin description"
            required
          ></v-text-field>
        </v-flex>

        

        <v-flex
          xs12
          md12
        >
          <v-file-input
            v-model="files"
            color="deep-purple accent-4"
            counter
            label="File input"
            multiple
            placeholder="Select your model file"
            prepend-icon="mdi-paperclip"
            outlined
            :display-size="1000"
            class="mt-5"
            @change="upload()"
  >

  
    <template v-slot:selection="{ index, text }">
      <v-chip
        v-if="index < 2"
        color="deep-purple accent-4"
        dark
        label
        small
      >
        {{ text }}
      </v-chip>

      <span
        v-else-if="index === 2"
        class="overline grey--text text--darken-3 mx-2"
      >
        +{{ files.length - 2 }} File(s)
      </span>
    </template>
  </v-file-input>
        </v-flex>

<v-flex
          xs12
          md12
        >
        <v-checkbox
            v-model="checkbox"
            :label="`Only privileged members can see this`"
        ></v-checkbox>
        </v-flex>

      </v-layout>
    </v-container>
  </v-form>

    <v-card-actions>
      <template>
  <div class="text-center">
    <v-btn
      :disabled="dialog"
      :loading="dialog"
      text
      @click="dialog = true"
    >
      Generate
    </v-btn>
    <v-dialog
      v-model="dialog"
      hide-overlay
      persistent
      width="450"
      height="200"
    >
      <v-card
        color="black"
      >
        <v-card-text>
          Processing your request...
          <v-progress-linear
            indeterminate
            color="white"
            class="my-3"
          ></v-progress-linear>
        </v-card-text>
      </v-card>
    </v-dialog>
    <v-layout justify-center>
    <v-dialog v-model="main_dialog" persistent max-width="30vw">
      <v-card color="black">
        <v-card-title class="headline">Success!</v-card-title>
        <v-card-text>Here's your NFT token, and block address:</v-card-text>
        <v-card-text class="overline pb-0">NFT: e0d123e5f316bef78bfdf5a00883757752c16ec452c1</v-card-text>
        <v-card-text class="overline pt-1">Address: 56857cfc709d3996f057252c16ec4656f5292802</v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="green darken-1" text @click="main_dialog = false">Copy keys</v-btn>
          <v-btn color="green darken-1" text @click="main_dialog = false">Okay!</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-layout>
  </div>
</template>
    </v-card-actions>

  </v-card>
</template>

<script>
import axios from 'axios';

  export default {
    data: () => ({
      dialog: false,
      main_dialog: false,
      file: '',
      files: [],
      valid: false,
      name: '',
      description: '',
      nameRules: [
        v => !!v || 'Twin Name is required',
        v => v.length <= 30 || 'Twin Name must be less than 30 characters',
      ],
      descRules: [
        v => !!v || 'Description is required',
        v => v.length <= 150 || 'Description must be less than 150 characters',
      ],
      checkbox: false,
      keydata: {
        "NFT": "e0d123e5f316bef78bfdf5a00883757752c16ec452c1",
        "Address": "56857cfc709d3996f057252c16ec4656f5292802"
      }
    }),
    methods: {
      upload() {
        this.file = this.$refs.file.files[0];
      },
      submitFile(){
            let formData = new FormData();
            axios.post( '/upload',
                formData,
                {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
              }
            ).then(function(){
          console.log('Success!');
        })
        .catch(function(){
          console.log('Error :(');
        });
      },
    },
    watch: {
      dialog (val) {
        if (!val) return
        setTimeout(() => (this.dialog = false), 3000)
        setTimeout(() => (this.main_dialog = true), 3000)
      },
    },
  }
</script>