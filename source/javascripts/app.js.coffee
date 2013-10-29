# app.js.coffee

d =
  gigs: [
    id: "526d198ab8cc48f349000002"
    position: 1
    artists: "526c6a73b8cc48252a000002"
  ,
    id: "526d198ab8cc48f349000004"
    position: 1
    artists: "51f3ee8c8cdd67057f00000a"
  ,
    id: "526d198ab8cc48f349000006"
    position: 1
    artists: "521b5c91b8cc48bc6c000011"
  ,
    id: "526d198ab8cc48f349000008"
    position: 1
    artists: "526c6a74b8cc48252a00000d"
  ,
    id: "526d198ab8cc48f349000009"
    position: 2
    artists: "526c6a74b8cc48252a00000f"
  ,
    id: "526d198ab8cc48f34900000a"
    position: 3
    artists: "526c6a74b8cc48252a000011"
  ,
    id: "526d198ab8cc48f34900000c"
    position: 1
    artists: "51f3ee8c8cdd67057f00000d"
  ,
    id: "526d1990b8cc4840a2000002"
    position: 1
    artists: "526c6a7eb8cc4826fe000009"
  ,
    id: "526d1991b8cc4840a2000003"
    position: 2
    artists: "51f4858c8cdd6788af000006"
  ,
    id: "526d1991b8cc4840a2000004"
    position: 3
    artists: "526c6a7eb8cc4826fe00000c"
  ,
    id: "526d198ab8cc48f34900000e"
    position: 1
    artists: "526c6a74b8cc48252a000016"
  ,
    id: "526d1991b8cc4840a2000006"
    position: 1
    artists: "526c6a7eb8cc4826fe00000f"
  ,
    id: "526d1986b8cc485c1a000002"
    position: 1
    artists: "526c6a6fb8cc48cb87000007"
  ,
    id: "526d1986b8cc485c1a000003"
    position: 2
    artists: "51f3ee8e8cdd67431d000028"
  ,
    id: "526d1986b8cc485c1a000004"
    position: 3
    artists: "526c6a6fb8cc48cb8700000a"
  ,
    id: "526d1984b8cc48f9ef000002"
    position: 1
    artists: "526c6a6cb8cc4882f1000002"
  ,
    id: "526d1984b8cc48f9ef000003"
    position: 2
    artists: "526c6a6db8cc4882f1000004"
  ,
    id: "526d1985b8cc48f9ef000004"
    position: 3
    artists: "526c6a6db8cc4882f1000006"
  ,
    id: "526d198ab8cc48f349000010"
    position: 1
    artists: "5213df29b8cc482620000066"
  ,
    id: "526d198ab8cc48f349000011"
    position: 2
    artists: "5213df29b8cc482620000068"
  ,
    id: "526d198ab8cc48f349000012"
    position: 3
    artists: "51f3ee8c8cdd67057f000033"
  ,
    id: "526d198ab8cc48f349000013"
    position: 4
    artists: "5213df29b8cc48262000006b"
  ,
    id: "526d198fb8cc483277000002"
    position: 1
    artists: "526c6a7ab8cc48b218000008"
  ,
    id: "526d198fb8cc483277000003"
    position: 2
    artists: "526c6a7ab8cc48b21800000a"
  ,
    id: "526d198fb8cc483277000004"
    position: 3
    artists: "526c6a7ab8cc48b21800000c"
  ,
    id: "526d198fb8cc483277000005"
    position: 4
    artists: "526c6a7ab8cc48b21800000e"
  ,
    id: "526d1991b8cc4840a2000008"
    position: 1
    artists: "5213df30b8cc48081e00009a"
  ,
    id: "526d1991b8cc4840a2000009"
    position: 2
    artists: "5213df30b8cc48081e00009c"
  ,
    id: "526d1991b8cc4840a200000a"
    position: 3
    artists: "5213df30b8cc48081e00009e"
  ,
    id: "526d1991b8cc4840a200000b"
    position: 4
    artists: "5213df30b8cc48081e0000a0"
  ,
    id: "526d1991b8cc4840a200000c"
    position: 5
    artists: "5213df30b8cc48081e0000a2"
  ,
    id: "526d1991b8cc4840a200000d"
    position: 6
    artists: "5213df30b8cc48081e0000a4"
  ,
    id: "526d1986b8cc485c1a000006"
    position: 1
    artists: "51f3ee8c8cdd67057f000057"
  ,
    id: "526d1987b8cc485c1a000007"
    position: 2
    artists: "51f3ee8c8cdd67057f000007"
  ,
    id: "526d1987b8cc485c1a000008"
    position: 3
    artists: "5213df26b8cc482eab000019"
  ,
    id: "526d1991b8cc4840a200000f"
    position: 1
    artists: "5213df30b8cc48081e0000a7"
  ,
    id: "526d1991b8cc4840a2000010"
    position: 2
    artists: "5213df30b8cc48081e0000a9"
  ,
    id: "526d198ab8cc48f349000015"
    position: 1
    artists: "526c6a74b8cc48252a00001e"
  ,
    id: "526d198ab8cc48f349000016"
    position: 2
    artists: "5213df29b8cc48262000005f"
  ,
    id: "526d198ab8cc48f349000017"
    position: 3
    artists: "526c6a74b8cc48252a000021"
  ,
    id: "51f582edb8cc48b6500000c5"
    position: 1
    artists: "51f57873b8cc4891f5000140"
  ,
    id: "51f582edb8cc48b6500000c6"
    position: 2
    artists: "51f57873b8cc4891f5000142"
  ,
    id: "51f582edb8cc48b6500000c7"
    position: 3
    artists: "51f57873b8cc4891f5000144"
  ,
    id: "51f582edb8cc48b6500000c8"
    position: 4
    artists: "51f57873b8cc4891f5000146"
  ,
    id: "526d1991b8cc4840a2000012"
    position: 1
    artists: "51f3ee8f8cdd6754d200005c"
  ,
    id: "526d1991b8cc4840a2000013"
    position: 2
    artists: "51f3ee8f8cdd6754d200005e"
  ,
    id: "526d1991b8cc4840a2000014"
    position: 3
    artists: "51f3ee8f8cdd6754d2000060"
  ,
    id: "526d1991b8cc4840a2000015"
    position: 4
    artists: "5213df30b8cc48081e0000af"
  ,
    id: "526d198ab8cc48f349000019"
    position: 1
    artists: "5213df2ab8cc48262000006d"
  ,
    id: "526d198ab8cc48f34900001b"
    position: 1
    artists: "521b5c91b8cc48bc6c000011"
  ,
    id: "526d198ab8cc48f34900001d"
    position: 1
    artists: "526c6a74b8cc48252a00000d"
  ,
    id: "526d198ab8cc48f34900001e"
    position: 2
    artists: "526c6a74b8cc48252a00000f"
  ,
    id: "526d198ab8cc48f34900001f"
    position: 3
    artists: "526c6a74b8cc48252a000011"
  ,
    id: "526d1991b8cc4840a2000017"
    position: 1
    artists: "526c6a7eb8cc4826fe000021"
  ,
    id: "526d1991b8cc4840a2000018"
    position: 2
    artists: "526c6a7db8cc4826fe000006"
  ,
    id: "526d1991b8cc4840a2000019"
    position: 3
    artists: "526c6a7eb8cc4826fe000024"
  ,
    id: "526d1991b8cc4840a200001a"
    position: 4
    artists: "521b5c98b8cc48fe0000001b"
  ,
    id: "51f582e9b8cc48b650000052"
    position: 1
    artists: "51f57870b8cc4891f500007b"
  ,
    id: "526d198ab8cc48f349000021"
    position: 1
    artists: "51f3ee8d8cdd67057f00006b"
  ,
    id: "526d198ab8cc48f349000022"
    position: 2
    artists: "521b5c93b8cc48bc6c000077"
  ,
    id: "526d1991b8cc4840a200001c"
    position: 1
    artists: "526c6a7eb8cc4826fe000028"
  ,
    id: "526d1991b8cc4840a200001d"
    position: 2
    artists: "5213df30b8cc48081e0000b2"
  ,
    id: "526d1991b8cc4840a200001e"
    position: 3
    artists: "51f3ee8f8cdd6754d2000062"
  ,
    id: "526d198ab8cc48f349000024"
    position: 1
    artists: "526c6a75b8cc48252a00002f"
  ,
    id: "526d198bb8cc48f349000025"
    position: 2
    artists: "526c6a75b8cc48252a000031"
  ,
    id: "526d1991b8cc4840a2000020"
    position: 1
    artists: "526c6a7eb8cc4826fe00002d"
  ,
    id: "526d1991b8cc4840a2000021"
    position: 2
    artists: "521b5c99b8cc48fe00000085"
  ,
    id: "526d1991b8cc4840a2000022"
    position: 3
    artists: "521b5c99b8cc48fe00000087"
  ,
    id: "526d1987b8cc485c1a00000a"
    position: 1
    artists: "521b5c8db8cc48aaa300000c"
  ,
    id: "526d198bb8cc48f349000027"
    position: 1
    artists: "526c6a75b8cc48252a000034"
  ,
    id: "526d1991b8cc4840a2000024"
    position: 1
    artists: "526c6a7fb8cc4826fe000032"
  ,
    id: "526d1991b8cc4840a2000025"
    position: 2
    artists: "5213df29b8cc482620000066"
  ,
    id: "526d1991b8cc4840a2000026"
    position: 3
    artists: "526c6a7fb8cc4826fe000035"
  ,
    id: "526d1991b8cc4840a2000027"
    position: 4
    artists: "526c6a7fb8cc4826fe000037"
  ,
    id: "526d1991b8cc4840a2000029"
    position: 1
    artists: "5213df30b8cc48081e0000b5"
  ,
    id: "526d1991b8cc4840a200002a"
    position: 2
    artists: "5213df30b8cc48081e0000b7"
  ,
    id: "526d1991b8cc4840a200002b"
    position: 3
    artists: "526c6a7fb8cc4826fe00003c"
  ,
    id: "526d1991b8cc4840a200002c"
    position: 4
    artists: "526c6a7fb8cc4826fe00003e"
  ,
    id: "526d198bb8cc48f349000029"
    position: 1
    artists: "5213df29b8cc482620000066"
  ,
    id: "526d198bb8cc48f34900002a"
    position: 2
    artists: "526c6a75b8cc48252a000038"
  ,
    id: "526d198bb8cc48f34900002b"
    position: 3
    artists: "51f3ee8e8cdd67431d000048"
  ,
    id: "526d198bb8cc48f34900002d"
    position: 1
    artists: "521b5c91b8cc48bc6c000011"
  ,
    id: "526d1991b8cc4840a200002e"
    position: 1
    artists: "526c6a7fb8cc4826fe000041"
  ,
    id: "526d1991b8cc4840a200002f"
    position: 2
    artists: "5213df30b8cc48081e0000af"
  ,
    id: "526d1991b8cc4840a2000030"
    position: 3
    artists: "526c6a7fb8cc4826fe000044"
  ,
    id: "526d1991b8cc4840a2000031"
    position: 4
    artists: "5213df30b8cc48081e000082"
  ,
    id: "526d198bb8cc48f34900002f"
    position: 1
    artists: "526c6a74b8cc48252a000016"
  ,
    id: "526d198bb8cc48f349000031"
    position: 1
    artists: "526c6a75b8cc48252a000040"
  ,
    id: "526d198bb8cc48f349000033"
    position: 1
    artists: "526c6a75b8cc48252a000043"
  ,
    id: "526d1991b8cc4840a2000033"
    position: 1
    artists: "526c6a7fb8cc4826fe000048"
  ,
    id: "526d1991b8cc4840a2000034"
    position: 2
    artists: "526c6a7fb8cc4826fe00004a"
  ,
    id: "526d1991b8cc4840a2000035"
    position: 3
    artists: "526c6a7fb8cc4826fe00004c"
  ,
    id: "526d1991b8cc4840a2000036"
    position: 4
    artists: "526c6a7fb8cc4826fe00004e"
  ,
    id: "526d198fb8cc483277000007"
    position: 1
    artists: "521b5c96b8cc487f91000037"
  ,
    id: "526d198fb8cc483277000008"
    position: 2
    artists: "521b5c96b8cc487f91000039"
  ,
    id: "526d198fb8cc483277000009"
    position: 3
    artists: "521b5c96b8cc487f9100003b"
  ,
    id: "526d198bb8cc48f349000035"
    position: 1
    artists: "526c6a75b8cc48252a000046"
  ,
    id: "526d198bb8cc48f349000039"
    position: 1
    artists: "526c6a75b8cc48252a00004c"
  ,
    id: "526d198bb8cc48f34900003b"
    position: 1
    artists: "526c6a75b8cc48252a00004f"
  ,
    id: "526d1991b8cc4840a2000038"
    position: 1
    artists: "526c6a7fb8cc4826fe000051"
  ,
    id: "526d1991b8cc4840a2000039"
    position: 2
    artists: "51f3ee8f8cdd6754d2000062"
  ,
    id: "526d198bb8cc48f34900003d"
    position: 1
    artists: "526c6a76b8cc48252a000052"
  ,
    id: "526d198bb8cc48f34900003e"
    position: 2
    artists: "526c6a76b8cc48252a000054"
  ,
    id: "526d1991b8cc4840a200003b"
    position: 1
    artists: "526c6a7fb8cc4826fe000055"
  ,
    id: "526d1991b8cc4840a200003c"
    position: 2
    artists: "51f3ee8c8cdd67057f000031"
  ,
    id: "526d1991b8cc4840a200003d"
    position: 3
    artists: "5213df2fb8cc48081e000057"
  ,
    id: "526d198bb8cc48f349000040"
    position: 1
    artists: "526c6a76b8cc48252a000057"
  ,
    id: "526d1991b8cc4840a200003f"
    position: 1
    artists: "526c6a7fb8cc4826fe00005a"
  ,
    id: "526d1991b8cc4840a2000040"
    position: 2
    artists: "526c6a7fb8cc4826fe00005c"
  ,
    id: "526d1991b8cc4840a2000041"
    position: 3
    artists: "526c6a7fb8cc4826fe00005e"
  ,
    id: "526d1991b8cc4840a2000042"
    position: 4
    artists: "526c6a7fb8cc4826fe000060"
  ,
    id: "526d1992b8cc4840a2000044"
    position: 1
    artists: "5213df2fb8cc48081e000042"
  ,
    id: "526d1992b8cc4840a2000045"
    position: 2
    artists: "526c6a7fb8cc4826fe000064"
  ,
    id: "526d1992b8cc4840a2000046"
    position: 3
    artists: "526c6a7fb8cc4826fe000066"
  ,
    id: "526d1992b8cc4840a2000047"
    position: 4
    artists: "526c6a7fb8cc4826fe000068"
  ,
    id: "526d198bb8cc48f349000042"
    position: 1
    artists: "521b5c93b8cc48bc6c00007a"
  ,
    id: "526d198bb8cc48f349000043"
    position: 2
    artists: "5213df2ab8cc482620000073"
  ,
    id: "526d1992b8cc4840a2000049"
    position: 1
    artists: "526c6a7fb8cc4826fe00006b"
  ,
    id: "526d198bb8cc48f349000045"
    position: 1
    artists: "526c6a76b8cc48252a00005d"
  ,
    id: "526d198cb8cc48f349000047"
    position: 1
    artists: "526c6a76b8cc48252a00005d"
  ,
    id: "526d1992b8cc4840a200004b"
    position: 1
    artists: "526c6a7fb8cc4826fe00006e"
  ,
    id: "526d1992b8cc4840a200004c"
    position: 2
    artists: "526c6a7fb8cc4826fe000070"
  ,
    id: "526d1992b8cc4840a200004d"
    position: 3
    artists: "526c6a7fb8cc4826fe000072"
  ,
    id: "526d1992b8cc4840a200004e"
    position: 4
    artists: "51f3ee8f8cdd6754d200001a"
  ,
    id: "526d1992b8cc4840a2000050"
    position: 1
    artists: "526c6a7fb8cc4826fe000076"
  ,
    id: "526d1992b8cc4840a2000051"
    position: 2
    artists: "5213df2eb8cc48081e00000e"
  ,
    id: "526d1992b8cc4840a2000052"
    position: 3
    artists: "526c6a7fb8cc4826fe000079"
  ,
    id: "526d1992b8cc4840a2000053"
    position: 4
    artists: "526c6a7fb8cc4826fe00007b"
  ,
    id: "526d198cb8cc48f349000049"
    position: 1
    artists: "521b5c91b8cc48bc6c000011"
  ,
    id: "526d198cb8cc48f34900004b"
    position: 1
    artists: "526c6a76b8cc48252a000064"
  ,
    id: "526d1987b8cc485c1a00000c"
    position: 1
    artists: "51f3ee8a8cdd675a6c000009"
  ,
    id: "526d1987b8cc485c1a00000d"
    position: 2
    artists: "526c6a70b8cc48cb87000014"
  ,
    id: "526d198cb8cc48f34900004d"
    position: 1
    artists: "526c6a76b8cc48252a000067"
  ,
    id: "526d1992b8cc4840a2000055"
    position: 1
    artists: "526c6a7fb8cc4826fe00007e"
  ,
    id: "526d1992b8cc4840a2000056"
    position: 2
    artists: "51f3ee8f8cdd6754d2000062"
  ,
    id: "526d1987b8cc485c1a00000f"
    position: 1
    artists: "51f4858c8cdd6788af000008"
  ,
    id: "526d1987b8cc485c1a000010"
    position: 2
    artists: "526c6a70b8cc48cb87000018"
  ,
    id: "526d1987b8cc485c1a000011"
    position: 3
    artists: "526c6a70b8cc48cb8700001a"
  ,
    id: "51f582ebb8cc48b65000008f"
    position: 1
    artists: "51f57871b8cc4891f500007f"
  ,
    id: "51f582ecb8cc48b650000090"
    position: 2
    artists: "51f57871b8cc4891f5000081"
  ,
    id: "526d1992b8cc4840a2000058"
    position: 1
    artists: "526c6a80b8cc4826fe000082"
  ,
    id: "526d1992b8cc4840a2000059"
    position: 2
    artists: "526c6a80b8cc4826fe000084"
  ,
    id: "526d1992b8cc4840a200005a"
    position: 3
    artists: "526c6a80b8cc4826fe000086"
  ,
    id: "526d1992b8cc4840a200005c"
    position: 1
    artists: "521bbce8b8cc48d2fc000056"
  ,
    id: "526d1992b8cc4840a200005d"
    position: 2
    artists: "5213df29b8cc482620000063"
  ,
    id: "526d1992b8cc4840a200005e"
    position: 3
    artists: "526c6a80b8cc4826fe00008b"
  ,
    id: "526d1992b8cc4840a200005f"
    position: 4
    artists: "526c6a80b8cc4826fe00008d"
  ,
    id: "526d198cb8cc48f34900004f"
    position: 1
    artists: "526c6a76b8cc48252a00006a"
  ]
  artists: [
    id: "526c6a73b8cc48252a000002"
    name: "Cirque Du Horror"
  ,
    id: "51f3ee8c8cdd67057f00000a"
    name: "Hares On The Mountain"
  ,
    id: "521b5c91b8cc48bc6c000011"
    name: "Paul Slavens And Friends"
  ,
    id: "526c6a74b8cc48252a00000d"
    name: "Riggs"
  ,
    id: "526c6a74b8cc48252a00000f"
    name: "Slater"
  ,
    id: "526c6a74b8cc48252a000011"
    name: "Seaton Jazz Experience"
  ,
    id: "51f3ee8c8cdd67057f00000d"
    name: "Dentonradio.com Night"
  ,
    id: "526c6a7eb8cc4826fe000009"
    name: "The Half Truths"
  ,
    id: "51f4858c8cdd6788af000006"
    name: "Darlington"
  ,
    id: "526c6a7eb8cc4826fe00000c"
    name: "City Mouse"
  ,
    id: "526c6a74b8cc48252a000016"
    name: "Joe Pat Hennen"
  ,
    id: "526c6a7eb8cc4826fe00000f"
    name: "Looking For Astronauts"
  ,
    id: "526c6a6fb8cc48cb87000007"
    name: "Av The Great"
  ,
    id: "51f3ee8e8cdd67431d000028"
    name: "Fab Deuce"
  ,
    id: "526c6a6fb8cc48cb8700000a"
    name: "Blue, The Misfit."
  ,
    id: "526c6a6cb8cc4882f1000002"
    name: "Poppy Xander"
  ,
    id: "526c6a6db8cc4882f1000004"
    name: "Bone Doggie And The Hic…"
  ,
    id: "526c6a6db8cc4882f1000006"
    name: "Tippsy Cupps And The..."
  ,
    id: "5213df29b8cc482620000066"
    name: "Babar"
  ,
    id: "5213df29b8cc482620000068"
    name: "The Demigs"
  ,
    id: "51f3ee8c8cdd67057f000033"
    name: "Savage And The Big Beat"
  ,
    id: "5213df29b8cc48262000006b"
    name: "Danny Rush & The Dd’s"
  ,
    id: "526c6a7ab8cc48b218000008"
    name: "Afro Deezy Axe"
  ,
    id: "526c6a7ab8cc48b21800000a"
    name: "Gravity Feed"
  ,
    id: "526c6a7ab8cc48b21800000c"
    name: "Human Groove Hormone"
  ,
    id: "526c6a7ab8cc48b21800000e"
    name: "Good Shive Low"
  ,
    id: "5213df30b8cc48081e00009a"
    name: "Do For It Records Annual Halloween Megashow!"
  ,
    id: "5213df30b8cc48081e00009c"
    name: "Shaolin Death Squad"
  ,
    id: "5213df30b8cc48081e00009e"
    name: "House Harkonnen"
  ,
    id: "5213df30b8cc48081e0000a0"
    name: "The Spectacle"
  ,
    id: "5213df30b8cc48081e0000a2"
    name: "The Phuss"
  ,
    id: "5213df30b8cc48081e0000a4"
    name: "Mescalero"
  ,
    id: "51f3ee8c8cdd67057f000057"
    name: "Ella Minnow"
  ,
    id: "51f3ee8c8cdd67057f000007"
    name: "The Calmative"
  ,
    id: "5213df26b8cc482eab000019"
    name: "Party Static"
  ,
    id: "5213df30b8cc48081e0000a7"
    name: "The Blow"
  ,
    id: "5213df30b8cc48081e0000a9"
    name: "Love Inks"
  ,
    id: "526c6a74b8cc48252a00001e"
    name: "Spooky Folk"
  ,
    id: "5213df29b8cc48262000005f"
    name: "Pageantry"
  ,
    id: "526c6a74b8cc48252a000021"
    name: "Peopleodeon"
  ,
    id: "51f57873b8cc4891f5000140"
    name: "Mike Scheidt (yob)"
  ,
    id: "51f57873b8cc4891f5000142"
    name: "Uzala"
  ,
    id: "51f57873b8cc4891f5000144"
    name: "Sabbath Assembly"
  ,
    id: "51f57873b8cc4891f5000146"
    name: "Tba"
  ,
    id: "51f3ee8f8cdd6754d200005c"
    name: "Mike Scheidt (yob)"
  ,
    id: "51f3ee8f8cdd6754d200005e"
    name: "Uzala"
  ,
    id: "51f3ee8f8cdd6754d2000060"
    name: "Sabbath Assembly"
  ,
    id: "5213df30b8cc48081e0000af"
    name: "Dead To A Dying World"
  ,
    id: "5213df2ab8cc48262000006d"
    name: "Rock Lottery Twelve"
  ,
    id: "526c6a7eb8cc4826fe000021"
    name: "Audacity"
  ,
    id: "526c6a7db8cc4826fe000006"
    name: "Pink Smoke"
  ,
    id: "526c6a7eb8cc4826fe000024"
    name: "War Party"
  ,
    id: "521b5c98b8cc48fe0000001b"
    name: "Anger House"
  ,
    id: "51f57870b8cc4891f500007b"
    name: "Quasi"
  ,
    id: "51f3ee8d8cdd67057f00006b"
    name: "Quasi"
  ,
    id: "521b5c93b8cc48bc6c000077"
    name: "Blues Control"
  ,
    id: "526c6a7eb8cc4826fe000028"
    name: "Hunters"
  ,
    id: "5213df30b8cc48081e0000b2"
    name: "The Bugs"
  ,
    id: "51f3ee8f8cdd6754d2000062"
    name: "Tba"
  ,
    id: "526c6a75b8cc48252a00002f"
    name: "The Royal Rhythmaires"
  ,
    id: "526c6a75b8cc48252a000031"
    name: "The Bellfuries"
  ,
    id: "526c6a7eb8cc4826fe00002d"
    name: "Sole"
  ,
    id: "521b5c99b8cc48fe00000085"
    name: "Serengeti"
  ,
    id: "521b5c99b8cc48fe00000087"
    name: "Matthewdavid"
  ,
    id: "521b5c8db8cc48aaa300000c"
    name: "Slaughter Daughters"
  ,
    id: "526c6a75b8cc48252a000034"
    name: "Wayne “the Train” Hancock"
  ,
    id: "526c6a7fb8cc4826fe000032"
    name: "Les Rhinocéros"
  ,
    id: "526c6a7fb8cc4826fe000035"
    name: "Bad Design"
  ,
    id: "526c6a7fb8cc4826fe000037"
    name: "Honey And Salt"
  ,
    id: "5213df30b8cc48081e0000b5"
    name: "White Lung"
  ,
    id: "5213df30b8cc48081e0000b7"
    name: "Antwon"
  ,
    id: "526c6a7fb8cc4826fe00003c"
    name: "Young Nuzzle"
  ,
    id: "526c6a7fb8cc4826fe00003e"
    name: "Back To Back"
  ,
    id: "526c6a75b8cc48252a000038"
    name: "Selfawarewolf"
  ,
    id: "51f3ee8e8cdd67431d000048"
    name: "Cleanup"
  ,
    id: "526c6a7fb8cc4826fe000041"
    name: "Samothrace"
  ,
    id: "526c6a7fb8cc4826fe000044"
    name: "Unconscious Collective"
  ,
    id: "5213df30b8cc48081e000082"
    name: "Cerulean Giallo"
  ,
    id: "526c6a75b8cc48252a000040"
    name: "Jfk: Breaking The News"
  ,
    id: "526c6a75b8cc48252a000043"
    name: "Peter Case"
  ,
    id: "526c6a7fb8cc4826fe000048"
    name: "Mauve Oed"
  ,
    id: "526c6a7fb8cc4826fe00004a"
    name: "Kody Jackson"
  ,
    id: "526c6a7fb8cc4826fe00004c"
    name: "Will Frenkel"
  ,
    id: "526c6a7fb8cc4826fe00004e"
    name: "Dj Don't Know And Foolish 2 Between Acts"
  ,
    id: "521b5c96b8cc487f91000037"
    name: "Voz Del Pueblo"
  ,
    id: "521b5c96b8cc487f91000039"
    name: "Errors In Human Digestion"
  ,
    id: "521b5c96b8cc487f9100003b"
    name: "Nabeel Z"
  ,
    id: "526c6a75b8cc48252a000046"
    name: "Naked Lunch: A Steely Dan Tribute"
  ,
    id: "526c6a75b8cc48252a00004c"
    name: "Kum Ba! Yah Yah! Presented By Orant Charities"
  ,
    id: "526c6a75b8cc48252a00004f"
    name: "Caravan Of Thieves"
  ,
    id: "526c6a7fb8cc4826fe000051"
    name: "Rare Monk"
  ,
    id: "526c6a76b8cc48252a000052"
    name: "Dead Confederate"
  ,
    id: "526c6a76b8cc48252a000054"
    name: "Equals"
  ,
    id: "526c6a7fb8cc4826fe000055"
    name: "La Luz"
  ,
    id: "51f3ee8c8cdd67057f000031"
    name: "Sealion"
  ,
    id: "5213df2fb8cc48081e000057"
    name: "Baños Y Baños"
  ,
    id: "526c6a76b8cc48252a000057"
    name: "The Dark Side Of Oz"
  ,
    id: "526c6a7fb8cc4826fe00005a"
    name: "The Room Outside"
  ,
    id: "526c6a7fb8cc4826fe00005c"
    name: "Vulgar Fashion"
  ,
    id: "526c6a7fb8cc4826fe00005e"
    name: "Pierre Bürger"
  ,
    id: "526c6a7fb8cc4826fe000060"
    name: "Dj K Falv0"
  ,
    id: "5213df2fb8cc48081e000042"
    name: "New Fumes"
  ,
    id: "526c6a7fb8cc4826fe000064"
    name: "Early Lines"
  ,
    id: "526c6a7fb8cc4826fe000066"
    name: "Drug Mountain"
  ,
    id: "526c6a7fb8cc4826fe000068"
    name: "Lemmons/ Forbes"
  ,
    id: "521b5c93b8cc48bc6c00007a"
    name: "Slobberbone"
  ,
    id: "5213df2ab8cc482620000073"
    name: "The O’s"
  ,
    id: "526c6a7fb8cc4826fe00006b"
    name: "Wiping Out Thousands"
  ,
    id: "526c6a76b8cc48252a00005d"
    name: "Sarah Jaffe"
  ,
    id: "526c6a7fb8cc4826fe00006e"
    name: "Vaz"
  ,
    id: "526c6a7fb8cc4826fe000070"
    name: "Bludded Head"
  ,
    id: "526c6a7fb8cc4826fe000072"
    name: "Strange Towers"
  ,
    id: "51f3ee8f8cdd6754d200001a"
    name: "Diamond Age"
  ,
    id: "526c6a7fb8cc4826fe000076"
    name: "Aisha Burns"
  ,
    id: "5213df2eb8cc48081e00000e"
    name: "Old Potion"
  ,
    id: "526c6a7fb8cc4826fe000079"
    name: "Ryan Thomas Becker"
  ,
    id: "526c6a7fb8cc4826fe00007b"
    name: "Jesse Miller"
  ,
    id: "526c6a76b8cc48252a000064"
    name: "Eleven Hundred Springs"
  ,
    id: "51f3ee8a8cdd675a6c000009"
    name: "Like Bridges We Burn"
  ,
    id: "526c6a70b8cc48cb87000014"
    name: "Dark Horse Darling"
  ,
    id: "526c6a76b8cc48252a000067"
    name: "Stage Fright. Denton Does The Band"
  ,
    id: "526c6a7fb8cc4826fe00007e"
    name: "Someone Still Loves You Boris Yeltsin"
  ,
    id: "51f4858c8cdd6788af000008"
    name: "The Faps"
  ,
    id: "526c6a70b8cc48cb87000018"
    name: "Electric Vengeance"
  ,
    id: "526c6a70b8cc48cb8700001a"
    name: "Samuel Caldwell's Reven…"
  ,
    id: "51f57871b8cc4891f500007f"
    name: "Porcelain Gods"
  ,
    id: "51f57871b8cc4891f5000081"
    name: "And Many More!!!"
  ,
    id: "526c6a80b8cc4826fe000082"
    name: "Liquor Store"
  ,
    id: "526c6a80b8cc4826fe000084"
    name: "Video"
  ,
    id: "526c6a80b8cc4826fe000086"
    name: "Fogg"
  ,
    id: "521bbce8b8cc48d2fc000056"
    name: "Dome Dwellers"
  ,
    id: "5213df29b8cc482620000063"
    name: "Bashe"
  ,
    id: "526c6a80b8cc4826fe00008b"
    name: "Space Goose"
  ,
    id: "526c6a80b8cc4826fe00008d"
    name: "Pansy Moon"
  ,
    id: "526c6a76b8cc48252a00006a"
    name: "Ray Wylie Hubbard"
  ]
  venues: [
    id: "51f3ee8b8cdd67057f000001"
    name: "Dan's Silverleaf"
  ,
    id: "51f3ee8e8cdd6754d2000001"
    name: "Rubber Gloves"
  ,
    id: "51f3ee8a8cdd678bc7000001"
    name: "Andys"
  ,
    id: "51f3ee898cdd675a6c000001"
    name: "Abbey Underground"
  ,
    id: "51f3ee8d8cdd67431d000001"
    name: "Hailey's Club"
  ,
    id: "51f57872b8cc4891f50000e8"
    name: "Rubber Gloves"
  ,
    id: "51f5786eb8cc4891f5000018"
    name: "Dan's Silverleaf"
  ,
    id: "51f57870b8cc4891f500007d"
    name: "Hailey's Club"
  ]
  shows: [
    id: "526d198ab8cc48f349000001"
    starts_at: "2013-10-27T17:00:00-05:00"
    source: "http://danssilverleaf.com/#show_1373"
    gigs: ["526d198ab8cc48f349000002"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198ab8cc48f349000003"
    starts_at: "2013-10-27T19:30:00-05:00"
    source: "http://danssilverleaf.com/#show_1391"
    gigs: ["526d198ab8cc48f349000004"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198ab8cc48f349000005"
    starts_at: "2013-10-28T22:00:00-05:00"
    source: "http://danssilverleaf.com/#show_1370"
    gigs: ["526d198ab8cc48f349000006"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198ab8cc48f349000007"
    starts_at: "2013-10-29T17:30:00-05:00"
    source: "http://danssilverleaf.com/#show_1387"
    gigs: ["526d198ab8cc48f349000008", "526d198ab8cc48f349000009", "526d198ab8cc48f34900000a"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198ab8cc48f34900000b"
    starts_at: "2013-10-29T20:00:00-05:00"
    source: "http://danssilverleaf.com/#show_1381"
    gigs: ["526d198ab8cc48f34900000c"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1990b8cc4840a2000001"
    starts_at: "2013-10-29T21:00:00-05:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1990b8cc4840a2000002", "526d1991b8cc4840a2000003", "526d1991b8cc4840a2000004"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d198ab8cc48f34900000d"
    starts_at: "2013-10-30T17:00:00-05:00"
    source: "http://danssilverleaf.com/#show_1399"
    gigs: ["526d198ab8cc48f34900000e"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1991b8cc4840a2000005"
    starts_at: "2013-10-30T21:00:00-05:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a2000006"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d1986b8cc485c1a000001"
    starts_at: "2013-10-31T20:00:00-05:00"
    source: "http://www.reverbnation.com/show/11762170"
    gigs: ["526d1986b8cc485c1a000002", "526d1986b8cc485c1a000003", "526d1986b8cc485c1a000004"]
    venues: "51f3ee8a8cdd678bc7000001"
  ,
    id: "526d1984b8cc48f9ef000001"
    starts_at: "2013-10-31T21:00:00-05:00"
    source: "http://www.reverbnation.com/show/11682371"
    gigs: ["526d1984b8cc48f9ef000002", "526d1984b8cc48f9ef000003", "526d1985b8cc48f9ef000004"]
    venues: "51f3ee898cdd675a6c000001"
  ,
    id: "526d198ab8cc48f34900000f"
    starts_at: "2013-10-31T21:00:00-05:00"
    source: "http://danssilverleaf.com/#show_1324"
    gigs: ["526d198ab8cc48f349000010", "526d198ab8cc48f349000011", "526d198ab8cc48f349000012", "526d198ab8cc48f349000013"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198fb8cc483277000001"
    starts_at: "2013-10-31T21:00:00-05:00"
    source: "http://haileysclub.com/calendar/"
    gigs: ["526d198fb8cc483277000002", "526d198fb8cc483277000003", "526d198fb8cc483277000004", "526d198fb8cc483277000005"]
    venues: "51f3ee8d8cdd67431d000001"
  ,
    id: "526d1991b8cc4840a2000007"
    starts_at: "2013-10-31T22:00:00-05:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a2000008", "526d1991b8cc4840a2000009", "526d1991b8cc4840a200000a", "526d1991b8cc4840a200000b", "526d1991b8cc4840a200000c", "526d1991b8cc4840a200000d"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d1986b8cc485c1a000005"
    starts_at: "2013-11-01T21:00:00-05:00"
    source: "http://www.reverbnation.com/show/11187325"
    gigs: ["526d1986b8cc485c1a000006", "526d1987b8cc485c1a000007", "526d1987b8cc485c1a000008"]
    venues: "51f3ee8a8cdd678bc7000001"
  ,
    id: "526d1991b8cc4840a200000e"
    starts_at: "2013-11-01T21:00:00-05:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a200000f", "526d1991b8cc4840a2000010"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d198ab8cc48f349000014"
    starts_at: "2013-11-01T22:00:00-05:00"
    source: "http://danssilverleaf.com/#show_1380"
    gigs: ["526d198ab8cc48f349000015", "526d198ab8cc48f349000016", "526d198ab8cc48f349000017"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "51f582edb8cc48b6500000c4"
    starts_at: "2013-11-02T21:00:00-05:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["51f582edb8cc48b6500000c5", "51f582edb8cc48b6500000c6", "51f582edb8cc48b6500000c7", "51f582edb8cc48b6500000c8"]
    venues: "51f57872b8cc4891f50000e8"
  ,
    id: "526d1991b8cc4840a2000011"
    starts_at: "2013-11-02T21:00:00-05:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a2000012", "526d1991b8cc4840a2000013", "526d1991b8cc4840a2000014", "526d1991b8cc4840a2000015"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d198ab8cc48f349000018"
    starts_at: "2013-11-02T21:30:00-05:00"
    source: "http://danssilverleaf.com/#show_1306"
    gigs: ["526d198ab8cc48f349000019"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198ab8cc48f34900001a"
    starts_at: "2013-11-04T22:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1395"
    gigs: ["526d198ab8cc48f34900001b"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198ab8cc48f34900001c"
    starts_at: "2013-11-05T17:30:00-06:00"
    source: "http://danssilverleaf.com/#show_1388"
    gigs: ["526d198ab8cc48f34900001d", "526d198ab8cc48f34900001e", "526d198ab8cc48f34900001f"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1991b8cc4840a2000016"
    starts_at: "2013-11-06T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a2000017", "526d1991b8cc4840a2000018", "526d1991b8cc4840a2000019", "526d1991b8cc4840a200001a"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "51f582e9b8cc48b650000051"
    starts_at: "2013-11-07T21:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1296"
    gigs: ["51f582e9b8cc48b650000052"]
    venues: "51f5786eb8cc4891f5000018"
  ,
    id: "526d198ab8cc48f349000020"
    starts_at: "2013-11-07T21:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1296"
    gigs: ["526d198ab8cc48f349000021", "526d198ab8cc48f349000022"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1991b8cc4840a200001b"
    starts_at: "2013-11-07T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a200001c", "526d1991b8cc4840a200001d", "526d1991b8cc4840a200001e"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d198ab8cc48f349000023"
    starts_at: "2013-11-08T21:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1385"
    gigs: ["526d198ab8cc48f349000024", "526d198bb8cc48f349000025"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1991b8cc4840a200001f"
    starts_at: "2013-11-08T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a2000020", "526d1991b8cc4840a2000021", "526d1991b8cc4840a2000022"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d1987b8cc485c1a000009"
    starts_at: "2013-11-09T20:00:00-06:00"
    source: "http://www.reverbnation.com/show/11321058"
    gigs: ["526d1987b8cc485c1a00000a"]
    venues: "51f3ee8a8cdd678bc7000001"
  ,
    id: "526d198bb8cc48f349000026"
    starts_at: "2013-11-09T21:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1349"
    gigs: ["526d198bb8cc48f349000027"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1991b8cc4840a2000023"
    starts_at: "2013-11-09T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a2000024", "526d1991b8cc4840a2000025", "526d1991b8cc4840a2000026", "526d1991b8cc4840a2000027"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d1991b8cc4840a2000028"
    starts_at: "2013-11-10T19:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a2000029", "526d1991b8cc4840a200002a", "526d1991b8cc4840a200002b", "526d1991b8cc4840a200002c"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d198bb8cc48f349000028"
    starts_at: "2013-11-10T22:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1402"
    gigs: ["526d198bb8cc48f349000029", "526d198bb8cc48f34900002a", "526d198bb8cc48f34900002b"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198bb8cc48f34900002c"
    starts_at: "2013-11-11T22:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1396"
    gigs: ["526d198bb8cc48f34900002d"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1991b8cc4840a200002d"
    starts_at: "2013-11-12T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a200002e", "526d1991b8cc4840a200002f", "526d1991b8cc4840a2000030", "526d1991b8cc4840a2000031"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d198bb8cc48f34900002e"
    starts_at: "2013-11-13T17:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1400"
    gigs: ["526d198bb8cc48f34900002f"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198bb8cc48f349000030"
    starts_at: "2013-11-13T20:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1356"
    gigs: ["526d198bb8cc48f349000031"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198bb8cc48f349000032"
    starts_at: "2013-11-14T21:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1378"
    gigs: ["526d198bb8cc48f349000033"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1991b8cc4840a2000032"
    starts_at: "2013-11-14T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a2000033", "526d1991b8cc4840a2000034", "526d1991b8cc4840a2000035", "526d1991b8cc4840a2000036"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d198fb8cc483277000006"
    starts_at: "2013-11-15T21:00:00-06:00"
    source: "http://haileysclub.com/calendar/"
    gigs: ["526d198fb8cc483277000007", "526d198fb8cc483277000008", "526d198fb8cc483277000009"]
    venues: "51f3ee8d8cdd67431d000001"
  ,
    id: "526d198bb8cc48f349000034"
    starts_at: "2013-11-15T22:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1366"
    gigs: ["526d198bb8cc48f349000035"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198bb8cc48f349000038"
    starts_at: "2013-11-17T18:30:00-06:00"
    source: "http://danssilverleaf.com/#show_1398"
    gigs: ["526d198bb8cc48f349000039"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198bb8cc48f34900003a"
    starts_at: "2013-11-18T20:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1401"
    gigs: ["526d198bb8cc48f34900003b"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1991b8cc4840a2000037"
    starts_at: "2013-11-18T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a2000038", "526d1991b8cc4840a2000039"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d198bb8cc48f34900003c"
    starts_at: "2013-11-19T21:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1355"
    gigs: ["526d198bb8cc48f34900003d", "526d198bb8cc48f34900003e"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1991b8cc4840a200003a"
    starts_at: "2013-11-20T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a200003b", "526d1991b8cc4840a200003c", "526d1991b8cc4840a200003d"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d198bb8cc48f34900003f"
    starts_at: "2013-11-21T21:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1351"
    gigs: ["526d198bb8cc48f349000040"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1991b8cc4840a200003e"
    starts_at: "2013-11-21T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1991b8cc4840a200003f", "526d1991b8cc4840a2000040", "526d1991b8cc4840a2000041", "526d1991b8cc4840a2000042"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d1991b8cc4840a2000043"
    starts_at: "2013-11-22T20:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1992b8cc4840a2000044", "526d1992b8cc4840a2000045", "526d1992b8cc4840a2000046", "526d1992b8cc4840a2000047"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d198bb8cc48f349000041"
    starts_at: "2013-11-22T21:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1310"
    gigs: ["526d198bb8cc48f349000042", "526d198bb8cc48f349000043"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1992b8cc4840a2000048"
    starts_at: "2013-11-23T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1992b8cc4840a2000049"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d198bb8cc48f349000044"
    starts_at: "2013-11-23T21:30:00-06:00"
    source: "http://danssilverleaf.com/#show_1392"
    gigs: ["526d198bb8cc48f349000045"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198cb8cc48f349000046"
    starts_at: "2013-11-24T17:30:00-06:00"
    source: "http://danssilverleaf.com/#show_1393"
    gigs: ["526d198cb8cc48f349000047"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1992b8cc4840a200004a"
    starts_at: "2013-11-24T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1992b8cc4840a200004b", "526d1992b8cc4840a200004c", "526d1992b8cc4840a200004d", "526d1992b8cc4840a200004e"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d1992b8cc4840a200004f"
    starts_at: "2013-11-25T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1992b8cc4840a2000050", "526d1992b8cc4840a2000051", "526d1992b8cc4840a2000052", "526d1992b8cc4840a2000053"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d198cb8cc48f349000048"
    starts_at: "2013-11-25T22:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1397"
    gigs: ["526d198cb8cc48f349000049"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d198cb8cc48f34900004a"
    starts_at: "2013-11-29T21:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1379"
    gigs: ["526d198cb8cc48f34900004b"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1987b8cc485c1a00000b"
    starts_at: "2013-11-30T20:00:00-06:00"
    source: "http://www.reverbnation.com/show/11781182"
    gigs: ["526d1987b8cc485c1a00000c", "526d1987b8cc485c1a00000d"]
    venues: "51f3ee8a8cdd678bc7000001"
  ,
    id: "526d198cb8cc48f34900004c"
    starts_at: "2013-11-30T21:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1386"
    gigs: ["526d198cb8cc48f34900004d"]
    venues: "51f3ee8b8cdd67057f000001"
  ,
    id: "526d1992b8cc4840a2000054"
    starts_at: "2013-12-06T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1992b8cc4840a2000055", "526d1992b8cc4840a2000056"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d1987b8cc485c1a00000e"
    starts_at: "2013-12-07T20:00:00-06:00"
    source: "http://www.reverbnation.com/show/11675736"
    gigs: ["526d1987b8cc485c1a00000f", "526d1987b8cc485c1a000010", "526d1987b8cc485c1a000011"]
    venues: "51f3ee8a8cdd678bc7000001"
  ,
    id: "51f582ebb8cc48b65000008e"
    starts_at: "2013-12-12T12:00:00-06:00"
    source: "http://haileysclub.com/calendar/"
    gigs: ["51f582ebb8cc48b65000008f", "51f582ecb8cc48b650000090"]
    venues: "51f57870b8cc4891f500007d"
  ,
    id: "526d1992b8cc4840a2000057"
    starts_at: "2013-12-15T21:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1992b8cc4840a2000058", "526d1992b8cc4840a2000059", "526d1992b8cc4840a200005a"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d1992b8cc4840a200005b"
    starts_at: "2014-01-11T22:00:00-06:00"
    source: "http://rubberglovesdentontx.com/calendar/"
    gigs: ["526d1992b8cc4840a200005c", "526d1992b8cc4840a200005d", "526d1992b8cc4840a200005e", "526d1992b8cc4840a200005f"]
    venues: "51f3ee8e8cdd6754d2000001"
  ,
    id: "526d198cb8cc48f34900004e"
    starts_at: "2014-01-30T21:00:00-06:00"
    source: "http://danssilverleaf.com/#show_1389"
    gigs: ["526d198cb8cc48f34900004f"]
    venues: "51f3ee8b8cdd67057f000001"
  ]




$(document).ready ()->
  artistViewModel = (artist)->
    self = this
    self.name = ko.observable artist.name
    self

  gigViewModel = (gig)->
    this.id = ko.observable gig.id
    this.position = ko.observable gig.position



  venue_by_id = (id)->
    for venue in d.venues
      return venue if venue.id is id
    nil
  venue_by_id = _.memoize venue_by_id

  show_by_id = (id)->
    for show in d.shows
      return show if show.id is id
    nil
  show_by_id = _.memoize show_by_id

  gig_by_id = (id)->
    for gig in d.gigs
      return gig if gig.id is id
    nil
  gig_by_id = _.memoize gig_by_id

  artist_by_id = (id)->
    for artist in d.artists
      return artist if artist.id is id
    nil
  artist_by_id = _.memoize artist_by_id

  handle_calendar_click = (event)->
    event.preventDefault()
    # console.log event, this
    $(this).siblings('.active').toggleClass('active')

    $(this).find('.shows').slideToggle 'fast'

    options =
      # height: 'toggle'
      width: "100%"
      'margin-left': 0

    if $.data this, 'margin-left'
      left = $.data(this, 'margin-left')
      $.removeData(this, 'margin-left')
      options['margin-left'] = left
      console.log left
    else
      $.data(this, 'margin-left', $(this).css( 'margin-left' ) )

    if $.data this, 'width'
      width = $.data(this, 'width')
      $.removeData(this, 'width')
      options.width = width
      console.log width
    else
      $.data(this, 'width', $(this).css( 'width' ) )

    # $.data( this, 'margin-left', default_left )

    console.log  $.data this, 'margin-left'

    # $.data this, 'width', $(this).css('width')

    # console.log $.data $(this), 'margin-left'
    # console.log $.data $(this), 'width'

    # options =
    #   # height: 'toggle'
    #   width: "100%"
    #   'margin-left': 0
    console.log options

    $(this).toggleClass('active').animate options, 250, 'linear'




  showViewModel = (show)->
    self = this
    self.starts_at = ko.observable show.starts_at
    self

  venueViewModel = (venue)->
    self = this
    self.name = ko.observable venue.name
    self




  calendar = _.groupBy d.shows, (item)->
    moment(item.starts_at).format("YYYY-MM-DD")

  dates = _.map calendar, (key, value, item)->
    classes = []
    classes.push 'count-' + key.length
    classes.push 'day-' + moment(value).format("ddd").toLowerCase()
    classes.push 'soon' if moment().diff(moment(value), 'days') > -10

    show_views = []

    for show in key
      sh = show_by_id show.id
      # console.log sh
      show_view = new showViewModel sh


      venue = venue_by_id show.venues
      # console.log venue
      venue = new venueViewModel venue

      # console.log venue

      show.venue = venue

      show.artists = []


      # console.log venue_by_id show.venues
      for gig_id in show.gigs
        gig = gig_by_id gig_id
        # gig = new gigViewModel gig


        artist = artist_by_id gig.artists
        artist_view = new artistViewModel( artist )
        # console.log artist
        show.artists.push artist_view


    id: value
    count: key
    month: moment(value).format("MMM")
    date: moment(value).format("DD")
    day: moment(value).format('ddd')
    count_class: classes.join(" ")

  d.calendar = dates
  # console.log d.calendar

  ko.applyBindings d, $('#calendar')[0]
  # ko.applyBindings d, $('#welcome')[0]

  $('.calendar', $('#calendar')[0] ).on 'click', handle_calendar_click
  # $('.calendar.active', $('#calendar')[0] ).on 'click', handle_calendar_unclick


