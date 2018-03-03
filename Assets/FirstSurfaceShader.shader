// This names the shader "HelloShader" and places it in the "MyShaders" dropdown
Shader "MyShaders/HelloShader" {

    // The properties are input fields that will be used in the shader function
    // _myColour is the variable name in the surface code.
    // "Example Colour" is the name in the editor.
    // Color is the type
    // (1, 1, 1, 1) is the default value
    Properties {
        _myColour ("Example Colour", Color) = (1, 1, 1, 1)
        _myEmission ("Example Emission", Color) = (1, 1, 1, 1)
        // _myNormal ("Example Normal", Color) = (1, 1, 1, 1)
    }

    // This is where the input properties, model geometry, surface colouring and
    // lighting are combined to produce the final effect
    SubShader {

        // This marks the beginning of the CG block, and is terminated by ENDCG
        CGPROGRAM
            // The below dictate how the shader is compiled. This includes the 
            // type of shader, the name of the shader function to be used, and
            // the lighting model respectively
            #pragma surface surf Lambert

            // The Input struct declares input data to be used by the function
            struct Input {
                float2 mainTex;
            };

            // In order to make use of the properties, they must be listed here
            // Their types also need to be specified
            fixed4 _myColour;
            fixed4 _myEmission;
            // fixed4 _myNormal;

            // This is the main shader function. IN represents the Input struct
            // Above. It also declares the type of output data to be expected.
            // The Lambert lighting model outputs a SurfaceOutput struct.
            // Abledo is the base colour of the surface
            // Emission is the light emitted from the surface
            void surf (Input IN, inout SurfaceOutput o) {
                o.Albedo = _myColour.rgb;
                o.Emission = _myEmission.rgb;
                // o.Normal = _myNormal.rgb;
            }
        ENDCG
    }

    // This is a basic effect to be used on the surface if the above shader is 
    // to GPU intensive to run properly
    FallBack "Diffuse"
}