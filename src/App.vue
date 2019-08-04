

<template>
  <v-app id="sweet">
    <v-app-bar
      app
      clipped-left
      color="grey darken-4"
    >
      <v-app-bar-nav-icon @click="drawer = !drawer" color="white"></v-app-bar-nav-icon>
      <v-layout><span class="title ml-3 mr-5">kSari&nbsp;&#9889;</span></v-layout>
      
      <v-text-field
        solo-inverted
        flat
        hide-details
        label="Search digital twins..."
        prepend-inner-icon="search"
      ></v-text-field>
      <v-spacer></v-spacer>
    </v-app-bar>

    <v-navigation-drawer
      v-model="drawer"
      app
      clipped
      color="grey darken-3"
    >
      <v-list
        dense
        class="grey darken-3"
      >
        <template v-for="(item, i) in items" >
          <v-layout
            v-if="item.heading"
            :key="i"
            align-center
          >
            <v-flex xs6>
              <v-subheader v-if="item.heading">
                {{ item.heading }}
              </v-subheader>
            </v-flex>
          </v-layout>
          <v-divider
            v-else-if="item.divider"
            :key="i"
            dark
            class="my-4"
          ></v-divider>
          <v-list-item
            v-else
            :key="i"
            @click="dash = !dash"
          >
            <v-list-item-action>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title class="grey-lighten-2--text">
                {{ item.text }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
      </v-list>
    </v-navigation-drawer>

    <v-content>
      <v-container
        fluid
        fill-height
        class="grey darken-2"
      >
        <v-layout
        >
          <v-container>
            
            <Dashboard v-if="dash" class="mb-5"></Dashboard>
            <NewTwin v-else></NewTwin>
            
          </v-container>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
  import Dashboard from './components/Dashboard';
  import NewTwin from './components/NewTwin';
  import '@toruslabs/torus-embed';


  export default {
    props: {
      source: String,
    },
    components: {
      Dashboard,
      NewTwin
    },
    created () {
      this.$vuetify.theme.dark = true
    },
    data: () => ({
      newTwin: false,
      dash: true,
      drawer: null,
      items: [
        { icon: 'account_circle', text: 'My Account' },
        { heading: 'Actions' },
        { icon: 'add', text: 'Create new twin' },
        { icon: 'touch_app', text: 'View my twins' },
        { divider: true },
        { heading: 'IPFS' },
        { icon: 'settings', text: 'Settings' },
        { icon: 'archive', text: 'Archive' },
        { icon: 'delete', text: 'Trash' },
        { divider: true },
        { heading: 'Personal' },
        { icon: 'settings', text: 'Settings' },
        { icon: 'chat_bubble', text: 'Support' },
        { icon: 'keyboard', text: 'Keyboard shortcuts' },
      ],
    }),
    methods: {
      show_dash() {
        this.newTwin = this.false;
        this.dash = true; 

      },
      show_new() {
        this.dash = false;
        this.newTwin = true;
      }
    },
    computed: {

    },
    beforeCreate: function () {
      console.log("Hello from Vue")
    }
  }
</script>

<style>

::-webkit-scrollbar {
  display: none;
}

#sweet .v-navigation-drawer__border {
  display: none
}

#torusWidget {
  left: 95vw !important;
  bottom: 93.5vh !important;
}

#torusMenuBtn, #torusLogin {
  height: 35px !important;
  width: 35px !important;
  border-radius: 50% !important;
}
</style>
