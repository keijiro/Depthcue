Shader "Hidden/Separator Overlay"
{
    Properties
    {
        _MainTex("Base", 2D) = "white" {}
        _MaskTex("Mask", 2D) = "white" {}
        _SeparatorTex("Separator", 2D) = "white" {}
    }

    CGINCLUDE

    #include "UnityCG.cginc"

    sampler2D _MainTex;
    sampler2D _MaskTex;
    sampler2D _SeparatorTex;
    
    half4 frag(v2f_img i) : COLOR
    {
        half4 source = tex2D(_MainTex, i.uv);
        half4 mask = tex2D(_MaskTex, i.uv);
        half4 separator = tex2D(_SeparatorTex, i.uv);
        return lerp(source, separator, (1 - mask.a) * separator.a);
    }

    ENDCG

    SubShader
    {
        ZTest Always Cull Off ZWrite Off
        Fog { Mode off }  
        Pass
        {
            CGPROGRAM
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma vertex vert_img
            #pragma fragment frag
            ENDCG
        }
    } 
    FallBack off
}
