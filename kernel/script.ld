ENTRY(_start)

SECTIONS
{
  . = 0x8200;
  .text : { *(.text) }
  . = 0x8000000;
  .data : { *(.data) }
  .bss : { *(.bss) }
}

