<template>
  <v-card
    class="mx-auto pa-5"
    outlined
  >
    <v-list-item three-line>
      <v-list-item-content>
        <div class="overline mb-4">DASHBOARD PANEL</div>
        <v-list-item-title class="display-1 mb-1">Siddharth Shanmuganathan</v-list-item-title>
        <v-list-item-subtitle>A quick look at all your data </v-list-item-subtitle>
      </v-list-item-content>

      <v-list-item-avatar
        circle
        size="100"
        color="grey"
        class="mr-5"
      >
       <img src="https://avatars2.githubusercontent.com/u/9303607?s=460&v=4" alt="avatar">
      </v-list-item-avatar>
    </v-list-item>

    <v-card-text class="my-5 mb-3">
        <v-container fluid grid-list-xl>
        <v-layout align-content-space-between>
            <v-flex xs-4 class="pa-1 pr-5 mr-5">
                    <h3 class="title mb-5">Current balance &#128176;</h3>
                <h1 class="display-3">51,634<h3 class="title d-inline">&nbsp;$</h3> </h1>
            </v-flex>
            <v-spacer>
                
            </v-spacer>
            <v-flex xs-4 class="pa-1 pl-5 ml-5">
                <h1 class="title pl-4 mb-2" color="white">My Digital Twins &#9802;</h1>
                <v-list-item two-line v-for="item in items.twins" :key="item.twins">
                    <v-list-item-content>
                        <v-list-item-title class="title">{{ item.name }}</v-list-item-title>
                        <v-list-item-subtitle class="subtitle-1">{{ item.desc }}</v-list-item-subtitle>
                </v-list-item-content>
                </v-list-item>
                <v-chip class="mt-2 ml-3 pa-3">
                    <h3 class="subtitle-2">and 13 more...</h3>
                </v-chip>
            </v-flex>
            <v-flex xs-4 class="pa-1">
                <h1 class="title pl-4 mb-2" color="white">Stats &#128200;</h1>
                <v-list-item two-line>
                    <v-list-item-content>
                        <v-list-item-title class="title">My custom notification</v-list-item-title>
                        <v-list-item-subtitle class="subtitle-1">and other stuff</v-list-item-subtitle>
                </v-list-item-content>
                </v-list-item>
                <v-chip class="mt-2 ml-3 pa-3">
                    <h3 class="subtitle-2">and 5 more...</h3>
                </v-chip>
            </v-flex>
        </v-layout>
        </v-container>
    </v-card-text>

    <v-card-actions>
      <v-btn text>My profile</v-btn>
      <v-btn text>Edit</v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
    data: () => ({
        items: {
            twins: [
                {
                    name: "This is a Digital Twin Name",
                    desc: "A short desription of the twin."
                },
                {
                    name: "Another Digital Twin Name",
                    desc: "Yet another short description* of the twin. Fun"
                }
            ]
            

        }
    })
}
</script>
